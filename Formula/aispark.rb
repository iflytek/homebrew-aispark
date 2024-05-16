class Aispark < Formula
  desc "aispark shell with llms"
  homepage "https://github.com/iflytek/spark-ai-cli"

  if Hardware::CPU.arm?
    url "https://github.com/iflytek/spark-ai-cli/releases/download/v0.1.3/aispark-darwin-arm64.gz"
    sha256 "9996ECE44904EF9DBAB31BBC04E8427A679212B42DB78A8A67CEDCC2277A050D"
  else
    url "https://github.com/iflytek/spark-ai-cli/releases/download/v0.1.3/aispark-darwin-amd64.gz"
    sha256 "69B8227CAE1397E14A0A5D00530F54C024A91F7EEB00F65D0C8E088AD01796C9"
  end

  def install
    if Hardware::CPU.arm?
      system "gzip", "-d", "aispark-darwin-arm64"
      bin.install "aispark-darwin-arm64" => "aispark"
    else
      system "gzip", "-d", "aispark-darwin-amd64"
      bin.install "aispark-darwin-amd64" => "aispark"
    end
  end

  test do
    system "#{bin}/aispark", "--version"
  end
end