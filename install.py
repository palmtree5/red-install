from __future__ import print_function
import os
import sys
from subprocess import call
import time


def alpine_install():
    raise NotImplementedError("Alpine isn't supported by this install script!")


def archlinux_install():
    raise NotImplementedError("Archlinux isn't supported by this install script!")


def fedora_install():
    try:
        import dnf
    except ImportError:
        print("You need to dnf install python-dnf!")
        raise
    base = dnf.base.Base()
    conf = base.conf
    conf.assumeyes = True
    conf.installroot = "/"
    base.read_all_repos()
    repos = base.repos
    base.fill_sack(load_system_repo='auto')


def opensuse_422_install():
    pass


def raspi_install():
    try:
        import apt
    except ImportError:
        print("You need to apt install python-apt!")
        raise


def macos_install():
    pass


def ubuntu_xenial_install():
    try:
        import apt
    except ImportError:
        print("You need to apt install python-apt!")
        raise
    cache = apt.cache.Cache()

    print("Installing prerequisite packages")
    pkgs = ["python3.5-dev", "python3-pip", "build-essential", "libssl-dev", "libffi-dev", "git", "ffmpeg", "libopus-dev", "unzip"]
    for pkg in pkgs:
        cache.update()
        cur = cache[pkg]
        cur.mark_install()
        cache.commit()
    call(["git", "clone", "-b", "develop", "https://github.com/Twentysix26/Red-DiscordBot"])


def debian_jessie_install():
    pass


def centos_7_install():
    pass


def main():
    if not sys.platform.startswith("linux"):
        raise RuntimeError("This is intended for Linux!")

    selected = -1

    while selected != 0:
        print("Red installation menu. Select your OS")
        print("1. Ubuntu 16.04")
        try:
            selected = int(input("Enter your selection: "))
        except ValueError:
            print("Invalid input!")
            time.sleep(5)
            print("\n"*35)
        else:
            if selected == 1:
                ubuntu_xenial_install()
            elif selected == 0:
                print("Exiting...")
                return


if __name__ == "__main__":
    main()
