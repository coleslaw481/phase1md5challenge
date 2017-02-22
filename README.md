[challenge]: https://www.synapse.org/#!Synapse:syn8080249/wiki/412159
[cwlrunner]: https://github.com/common-workflow-language/cwltool
[vagrant]: https://www.vagrantup.com/
[virtualbox]: https://www.virtualbox.org/wiki/VirtualBox
[git]: https://git-scm.com/
[centos]: https://www.centos.org/
[md5sumtool]: https://dockstore.org/containers/quay.io/briandoconnor/dockstore-tool-md5sum
# phase1md5challenge

This source tree contains a [Vagrant][vagrant] configuration which creates a [Centos 7][centos] virtual machine with [cwl-runner][cwlrunner] and all of its needed prerequesites installed. This allows the user to bring up the virtual machine and invoke a few commands to run the [md5sum workflow][md5sumtool].

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


```Bash
git clone https://github.com/coleslaw481/phase1md5challenge.git
cd phase1md5challenge
```
**NOTE:** If [Git][git] command line tool is **NOT** available simply download this source tree via https://github.com/coleslaw481/phase1md5challenge, unzip the downloaded file, cd into the unzipped directory, and continue with step 2.

#### Step 2) Spin up the virtual machine with [Vagrant][vagrant]

Please note this command takes a few minutes since it is setting up a virtual machine.

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

The answer will be stored in **md5sum.txt** file

Example output from running above command:

```Bash
Resolved 'Dockstore.cwl' to 'file:///home/vagrant/Dockstore.cwl'
['docker', 'pull', 'quay.io/briandoconnor/dockstore-tool-md5sum:1.0.2']
1.0.2: Pulling from briandoconnor/dockstore-tool-md5sum
8aec416115fd: Pull complete 
695f074e24e3: Pull complete 
946d6c48c2a7: Pull complete 
bc7277e579f0: Pull complete 
2508cbcde94b: Pull complete 
a3ed95caeb02: Pull complete 
b1f19f922e23: Pull complete 
3fa75a7b6e87: Pull complete 
Digest: sha256:23bf499256200ecb7f841304325348fa4b8b0d822b36ab6363c4c6ed857d120f
Status: Downloaded newer image for quay.io/briandoconnor/dockstore-tool-md5sum:1.0.2
[job Dockstore.cwl] /tmp/tmp9juTjX$ docker \
    run \
    -i \
    --volume=/home/vagrant/md5sum.input:/var/lib/cwl/stg3b40cc3a-1294-44f8-8022-222ceb328527/md5sum.input:ro \
    --volume=/tmp/tmp9juTjX:/var/spool/cwl:rw \
    --volume=/tmp/tmpgPSGtz:/tmp:rw \
    --workdir=/var/spool/cwl \
    --read-only=true \
    --user=1000 \
    --rm \
    --env=TMPDIR=/tmp \
    --env=HOME=/var/spool/cwl \
    quay.io/briandoconnor/dockstore-tool-md5sum:1.0.2 \
    /bin/my_md5sum \
    /var/lib/cwl/stg3b40cc3a-1294-44f8-8022-222ceb328527/md5sum.input
[job Dockstore.cwl] completed success
{
    "output_file": {
        "format": "http://edamontology.org/data_3671", 
        "checksum": "sha1$1250816c19c6f5524c5366b56c7a1eed6f3c3ab3", 
        "basename": "md5sum.txt", 
        "location": "file:///home/vagrant/md5sum.txt", 
        "path": "/home/vagrant/md5sum.txt", 
        "class": "File", 
        "size": 33
    }
}
Final process status is success

real	0m26.730s
user	0m1.292s
sys	0m0.261s
```

# COPYRIGHT AND LICENSE

See https://raw.githubusercontent.com/coleslaw481/phase1md5challenge/master/License.txt

