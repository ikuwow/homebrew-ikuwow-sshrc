class Sshrc < Formula
  desc "Bring your .bashrc, .vimrc, etc. with you when you SSH"
  homepage "https://github.com/ikuwow/sshrc"
  url "https://github.com/ikuwow/sshrc/archive/0.7.0.tar.gz"
  sha256 "09dc3ab22d07674fd7f226de5b16689012d30bda1e95a84354c0902cf10991f8"
  head "https://github.com/ikuwow/sshrc.git"

  bottle :unneeded

  def install
    bin.install %w[sshrc moshrc]
  end

  test do
    touch testpath/".sshrc"
    (testpath/"ssh").write <<~EOS
      #!/bin/sh
      true
    EOS
    chmod 0755, testpath/"ssh"
    ENV.prepend_path "PATH", testpath
    system "#{bin}/sshrc", "localhost"
  end
end
