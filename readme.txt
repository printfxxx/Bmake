BMAKE RELEASE NOTE

WHAT IS BMAKE?

  Bmake is a common makefile framework for project. Easy for use, modify and extend.

WHAT IS THE FEATURE?

  * Kconfig based config configurator. Easy for custom your project.
  * Excellent dependency check. You always only need to execute 'make' when you build your project.
  * Parallel build support. Speed-up your build.
  * Easy to add & remove sources & dirs.
  * GNU compiler support.
  * Extension makefile support.
  * Multi-projects support.
  * Both linux & windows support.

  1) Get Bmake:
     > git clone https://github.com/printfxxx/Bmake.git

  2) Checkout example:
     > git checkout example

  3) Do build:
     > make

  Now you build example successful.

  4) Do debug
     > make gdb

  5) Generate document if you have doxygen installed:
     > make dox

GET HELP

  Print help information

     > make help

FILES & DIRS LAYOUT

  <top>
   |
   +----- Makefile		Main makefile
   |
   +----- cfg.mk		Base config setting
   |
   +----- ext.mk		Extension makefile list
   |
   +----- func.mk		Functions and macros for Bmake
   |
   +----- rule.mk		Rule for make in every dirs
   |
   +----- ext/			Extension makefiles
   |
   +----- gen/			Generate directory
   |
   +----- opt/			Output directory
   |
   +----- tools/		tools directory
   |
   +----- readme.txt		This readme file

EXTENSION MAKEFILE LIST

  archive.mk			Archive project into .tar.bz2, .tar.gz or zip format file

  cygwin.mk			Cygwin environment support

  dox.mk			Generate document with doxygen

  gcc.asm.mk			ASM source file support

  gcc.c.mk			C source file support

  gcc.cxx.mk			C++ source file support

  gcc.h.mk			Generate header file with gcc

  gcc.mk			GNU compiler support

  gdb.mk			GNU debugger support

  kmod.mk			Linux kernel module build support

  mconf.mk			mconf support

HOW TO ADD MODULE & DIRS

  First, you need create 'Makefile' in every source directory.

  * Add obj file.
    Add [ filename ].o to var 'obj' or 'obj-y'. Bmake will search corresponding
    source file. For example, add 'foo.c':
	obj-y += foo.o

  * Add sub-directory.
    Add [ dirname ]/ to var 'obj' or 'obj-y'. For example, add dir 'foo':
	obj-y += foo/

  * Add obj that contain multi obj files.
    Add [ filename ].o to var 'obj' or 'obj-y' and add sub obj to var that named '[ filename ].o'.
    For example, add 'foo.o', and sub obj is 'foo1.o foo2.o foo3.o':
	obj-y += foo.o
	foo.o  = foo1.o foo2.o foo3.o

  * Add static library.
    Add lib[ filename ].a to var 'obj' or 'obj-y' and add sub obj to var that named 'lib[ filename ].a'.
    For example, add 'libfoo.a', and sub obj is 'foo1.o foo2.o foo3.o':
	obj-y += libfoo.a
	libfoo.a = foo1.o foo2.o foo3.o

  * Add share library.
    Add lib[ filename ].a to var 'obj' or 'obj-y' and add sub obj to var that named 'lib[ filename ].so'.
    For example, add 'libfoo.so', and sub obj is 'foo1.o foo2.o foo3.o':
	obj-y += libfoo.so
	libfoo.so = foo1.o foo2.o foo3.o

  * Add options to CFLAGS for this make level & all sub make level.
    Add [ options ] to var 'CFLAGS' or 'CFLAGS-y'. For example, add option '-g3':
    CFLAGS-y += -g3

  * Add options to CFLAGS for this make level.
    Add [ options ] to var 'cflags' or 'cflags-y'. For example, add option '-g3':
    cflags-y += -g3

  * Add options to CFLAGS for single obj.
    Add [ options ] to var 'cflags_[ obj ]'. For example, add option '-g3' for 'foo.o':
    cflags_foo.o += -g3

  * Language extra CFLAGS.
    c:	 CCFLAGS, CCFLAGS-y, ccflags, ccflags-y
    asm: ASFLAGS, ASFLAGS-y, asflags, asflags-y
    c++: CXXFLAGS, CXXFLAGS-y, cxxflags, cxxflags-y

OUTPUT-TARGET

  * Add output target
    Add [ filename ] to var 'out' or 'out-y' and add obj or dir to var that named '[ filename ]'.
    For example, add 'project1' and 'project2', dir are 'dir1/' and 'dir2/':
    out = project1 project2
    project1 = dir1/
    project2 = dir2/

  * Add options to LDFLAGS for out.
    Add [ options ] to var 'LDFLAGS', 'LDFLAGS-y', 'ldflags' or 'ldflags-y'. For example, add option '-lpthread':
    LDFLAGS-y += -lpthread

  * Add options to LDFLAGS for single out.
    Add [ options ] to var 'ldflags_[ out ]'. For example, add option '-lpthread' for '$(optdir)project1':
    ldflags_project1 += -lpthread

HOW TO WRITE EXTENSION MAKEFILE

  All extension Makefile file should be add in 'ext.mk'. There are two list in 'ext.mk':
  EXTMF_LIST & EXTR_LIST.
  All extension Makefile add to EXTMF_LIST will be load in top level Makefile.
  All extension Makefile add to EXTR_LIST will be load in rule.mk and work in topdir & subdir.

  In each extension Makefile, there are two segment: segment V & segment R. So each extension
  Makefile should define variable in 'segment V' & make rules in 'segment R'.

HOW TO BUILD IN PARALLEL MODE

  You can add parameter -jN to specifies the number of jobs to build simultaneously. For example, run 4 jobs
  simultaneously:
  > make -j4

HOW TO BUILD MCONF

  If you want to use Kconfig based configurator, You need build mconf. Download kconfig-frontends from
  "http://ymorin.is-a-geek.org/projects/kconfig-frontends". For example:
     Linux host
     > tar jxvf kconfig-frontends-3.12.0.0.tar.bz2
     > mkdir build
     > cd build
     > ../kconfig-frontends-3.12.0.0/configure --disable-shared --enable-frontends=mconf
     > make
     > strip frontends/mconf/mconf
     After build, you will get file 'mconf' under "frontends/mconf/mconf". Add it into your
     executable search path:
     > export PATH=$PATH:<path-to-mconf>

     Windows host
     Install cygwin environment and all necessary tools & libraries.
     > tar jxvf kconfig-frontends-3.12.0.0.tar.bz2
     > mkdir build
     > cd build
     > ../kconfig-frontends-3.12.0.0/configure --disable-shared --enable-frontends=mconf
     > make
     > strip frontends/mconf/mconf
     After build, you will get file 'mconf' under "frontends/mconf/mconf". Add it into your
     executable search path:
     > export PATH=$PATH:<path-to-mconf>

