class Aispark < Formula
  desc "aispark shell with llms"
  homepage "https://github.com/iflytek/spark-ai-cli"
  version "v0.1.6"

  armsha256="a5dd8ebe4e1439ee80b97c529599260e48caafeb19e732b71124d1be1e1cb594"
  amdsha256="44648f2eea084042e9ac4c277378164002742db1b8d670cfe3720bb16bfad435"
  if Hardware::CPU.arm?
    url "http://repo.model.xfyun.cn/api/packages/aispark/generic/aispark/v0.1.6/aispark-darwin-arm64.tar.gz"
    sha256 armsha256
  else
    url "http://repo.model.xfyun.cn/api/packages/aispark/generic/aispark/v0.1.6/aispark-darwin-amd64.tar.gz"
    sha256 amdsha256
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
