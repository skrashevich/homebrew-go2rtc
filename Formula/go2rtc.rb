class Go2rtc < Formula
    desc "Ultimate camera streaming application with support RTSP, RTMP, HTTP-FLV, WebRTC, MSE, HLS, MP4, MJPEG, HomeKit, FFmpeg, etc."
    homepage "https://github.com/AlexxIT/go2rtc"
    url "https://github.com/AlexxIT/go2rtc/archive/refs/tags/v1.6.0.tar.gz"
    sha256 "680abb0b6fb455a6008de635f817770e131b9994f5cb565cb8a210c99a5a5d56"
    version "1.6.0"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
        ENV["GOOS"] = "darwin"
        ENV["GOARCH"] = Hardware::CPU.arm? ? "arm64" : "amd64"
        ENV["CGO_ENABLED"] = "0"
        system "go", "build", "-ldflags", "-s -w", "-trimpath", "-o", "#{bin}/", "."
    end
  
    test do
        assert_match "Current version:  1.6.0", shell_output("#{bin}/go2rtc -version", 2)
    end
  end
  