class Aispark < Formula
  desc "aispark shell with llms"
  homepage "https://github.com/iflytek/spark-ai-cli"
  version "v0.1.4"

  armsha256 "5cd85fde259bdf0b41148e7e52ab907af8077e687e671f7084e74961e2d62419"
  amdsha256 "04c2d537a8bf4defb7831a1be6fddda0f44f345ea6454e16464d9f4dddfb7221"
  if Hardware::CPU.arm?
    url "http://repo.model.xfyun.cn/api/packages/aispark/generic/aispark/v0.1.4/aispark-darwin-arm64.tar.gz"
    sha256 armsha256
  else
    url "http://repo.model.xfyun.cn/api/packages/aispark/generic/aispark/v0.1.4/aispark-darwin-amd64.tar.gz"
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
