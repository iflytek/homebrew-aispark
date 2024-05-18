class Aispark < Formula
  desc "aispark shell with llms"
  homepage "https://github.com/iflytek/spark-ai-cli"
  version "v0.1.5"

  armsha256="9bb1b6cddf8c8e8e156fe39f4e32897f7ed4563c93f7324c2dec042a43e105c6"
  amdsha256="56a542283ca332001e6c6796fb980585aaa410a608bde06a4a8aa3487af4311a"
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
