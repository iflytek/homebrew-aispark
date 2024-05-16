class Aispark < Formula
  desc "aispark shell with llms"
  homepage "https://github.com/iflytek/spark-ai-cli"
  version "2.1.4"

  if Hardware::CPU.arm?
    url "https://github.com/iflytek/spark-ai-cli/releases/download/v0.1.3/aispark-darwin-arm64.tar.gz"
    sha256 "76D10D4E4B74CFF0D252B883A5328CD976990FE29AF6160A960AB8814A590B86"
  else
    url "https://github.com/iflytek/spark-ai-cli/releases/download/v0.1.3/aispark-darwin-amd64.tar.gz"
    sha256 "E981320BFF80046BF32EB42B5AE61D93640B19F603F518D2E69DC26C9D6DE90C"
  end

  def install
    # 解压 .tar.gz 文件
    system "tar", "-xzf", cached_download

    # 将解压后的可执行文件安装到 bin 目录
    if Hardware::CPU.arm?
      bin.install "aispark-darwin-arm64" => "aispark"
    else
      bin.install "aispark-darwin-amd64" => "aispark"
    end
  end

  test do
    system "#{bin}/aispark", "--version"
  end
end
