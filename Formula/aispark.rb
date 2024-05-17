class Aispark < Formula
  desc "aispark shell with llms"
  homepage "https://github.com/iflytek/spark-ai-cli"
  version "v0.1.5"

  armsha256="9ccc7cc644770304a4cd23bbb1b97f4c0231418c72b3f06b5a3c366350b892b9"
  amdsha256="ab959820320078a83d9cf6cbd5863bd4f06b406d8ee7f4d9b5f216ed2417cf22"
  if Hardware::CPU.arm?
    url "http://repo.model.xfyun.cn/api/packages/aispark/generic/aispark/v0.1.5/aispark-darwin-arm64.tar.gz"
    sha256 armsha256
  else
    url "http://repo.model.xfyun.cn/api/packages/aispark/generic/aispark/v0.1.5/aispark-darwin-amd64.tar.gz"
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
