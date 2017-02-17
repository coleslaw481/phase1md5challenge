[challenge]: https://www.synapse.org/#!Synapse:syn8080249/wiki/412159
[cwlrunner]: https://github.com/common-workflow-language/cwltool
[vagrant]: https://www.vagrantup.com/
[virtualbox]: https://www.virtualbox.org/wiki/VirtualBox
[git]: https://git-scm.com/
# phase1md5challenge

This source tree contains a [Vagrant][vagrant] configuration which creates a [Centos 7][centos] virtual machine with [cwl-runner][cwlrunner] and all of its needed prerequesites installed. This allows the user to bring up the virtual machine and invoke a few commands to run the md5sum workflow.

Contains files for [GA4GH Tool Execution Challenge][challenge].

### Requirements 

* [Vagrant][vagrant]
* [Virtual Box][virtualbox]
* >=4gb ram
* Linux/Mac with a terminal, Windows should also work but the instructions are not provided.

**NOTE:** Although not required installation of [Git][git] is used to download this source tree to the local machine.

### Running the workflow from Linux/Mac computer

Below are steps to run the md5sum workflow in a [Vagrant][vagrant] virtual machine. The instructions below assume a Linux or Mac OS, but it should in theory work on a Windows box 

#### Step 1) Download configuration files

If [Git][git] command line tool is installed run the following from a terminal

```Bash
git clone https://github.com/coleslaw481/phase1md5challenge.git
cd phase1md5challenge
```

#### Step 2) Spin up the virtual machine with [Vagrant][vagrant]

```Bash
vagrant up
```

#### Step 3) Connect to the virtual machine and download needed files

```Bash
vagrant ssh

wget https://raw.githubusercontent.com/briandoconnor/dockstore-tool-md5sum/master/Dockstore.cwl
wget https://raw.githubusercontent.com/briandoconnor/dockstore-tool-md5sum/master/md5sum.input
wget https://raw.githubusercontent.com/briandoconnor/dockstore-tool-md5sum/master/test.json
```

#### Step 4) Run the workflow

```Bash
time cwl-runner --non-strict Dockstore.cwl test.json
```
