from __future__ import print_function
import os
import sys
from subprocess import call
import time


def _chown(path, uid, gid):
    # http://snipplr.com/view/47687/python-recursive-change-uid-and-gid-chown-of-directory/
    os.chown(path, uid, gid)
    for item in os.listdir(path):
        itempath = os.path.join(path, item)
        if os.path.isfile(itempath):
            os.chown(itempath, uid, gid)
        elif os.path.isdir(itempath):
            os.chown(itempath, uid, gid)
            _chown(itempath, uid, gid)


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
    print("Downloading the bot's files")
    call(["git", "clone", "-b", "develop", "https://github.com/Twentysix26/Red-DiscordBot"])
    uid = os.stat(".").st_uid
    gid = os.stat(".").st_gid
    path = "Red-DiscordBot"
    """Recursively sets ownership of the bot's directory, files, and
       subdirectories to the owner of the folder we're in. We do this
       because othewise the files are owned by the root user because
       this installer requires root to install the requirements"""
    _chown(path, uid, gid)


def debian_jessie_install():
    try:
        import apt
    except ImportError:
        print("You need to apt install python-apt!")
        raise
    cache = apt.cache.Cache()

    print("Installing prereqisite packages")

    cache.update()

    pkgs = ["build-essential", "libssl-dev", "libffi-dev", "git", "ffmpeg", "libopus-dev", "unzip"]
    for pkg in pkgs:
        cache.update()
        cur = cache[pkg]
        cur.mark_install()
    cache.commit()
    maindir = os.getcwd()
    print("Installing the needed version of Python...")
    call(["wget", "https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz"])
    call(["tar", "xvf", "Python-3.6.0.tgz"])
    os.chdir("Python-3.6.0")
    call(["./configure", "--enable-optimizations"])
    import multiprocessing as mp
    core_count = mp.cpu_count()
    j_arg = "-j{}".format(core_count)
    call(["make", j_arg])
    call(["make", "altinstall"])
    os.chdir(maindir)
    call(["wget", "https://bootstrap.pypa.io/get-pip.py"])
    call(["python3.6", "get-pip.py"])
    print("Downloading the bot's files")
    call(["git", "clone", "-b", "develop", "https://github.com/Twentysix26/Red-DiscordBot"])
    uid = os.stat(".").st_uid
    gid = os.stat(".").st_gid
    path = "Red-DiscordBot"
    """Recursively sets ownership of the bot's directory, files, and
       subdirectories to the owner of the folder we're in. We do this
       because othewise the files are owned by the root user because
       this installer requires root to install the requirements"""
    _chown(path, uid, gid)


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
        else:
            if selected == 1:
                ubuntu_xenial_install()
                return
            elif selected == 0:
                print("Exiting...")
                return


if __name__ == "__main__":
    main()
    print("\n"*5)
    print("Done installing the requirements and downloading the bot\n" +
          "Once the installer has exited, do 'cd Red-DiscordBot' then 'python3 launcher.py'\n" +
          "to run the launcher. Install requirements by selecting 4 on the main menu\n" +
          "and select the option you want in the menu that appears\n" + 
          "(depending on whether or not you want audio). Then return to the main menu and select" +
          "the appropriate option to run Red. Follow the instructions for initial setup")
