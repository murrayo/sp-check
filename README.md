# sp-check
Quick review InterSystems IRIS SystemPerformance output.

# system performance check

## Create docker container

The docker container uses Alpine Linux (about 45MB)

- `cd` to folder with source files
- build container `docker build --no-cache -t sp_check .`
- run the container, pointing at a pButtons or SystemPerformance file, e.g:

```plaintext
docker run -v `pwd`:/data --rm --name sp_check sp_check ./sp_check.py -i /data/relative/path/to/mysystems_systemperformance_24hour_1sec.html
```

- only one argument `-i filename.html` to point to the pButtons or SystemPerformance file.

---

It is simplest to copy the file to the same folder as the script, e.g.

```plaintext
$ ls mysystems_systemperformance_24hour_1sec.html Dockerfile sp_check.py
```

```plaintext
docker run -v `pwd`:/data --rm --name sp_check sp_check ./sp_check.py -i /data/mysystems_systemperformance_24hour_1sec.html
```

---

## Run from command line

- Assumes you have Python 3 installed.

```plaintext
./sp_check.py -i "/ZCust/mysystems_systemperformance_24hour_1sec.html"
```

---

## Sample output

```plaintext
$ ./sp_check.py -i "/ZCust/mysystems_systemperformance_24hour_1sec.html"

System Summary for Your Name Here

Hostname         : hostymchostface
Instance         : MYSITELIVE
Operating system : Linux
Platform         : N/A
CPUs             : 16
Processor model  : Intel(R) Xeon(R) Gold 6148 CPU @ 2.40GHz
Memory           : 252 GB
Shared memory    : globals 125000 MB + routines 1000 MB + gmheap 512 MB = 126,512 MB
Version          : Cache for UNIX (Red Hat Enterprise Linux for x86-64) 2017.2.2 (Build 865_3_19085U) Tue Jul 23 2019 16:55:24 EDT [HealthShare Modules:Core:15.032.9688 + Linkage Engine:15.032.9688]
Date collected   : Profile run "24hours" started at 00:01:00 on Jun 01 2021.

Passes:
- HugePages is set:
- Total memory is 257,789 MB.
- 75% of total memory is 193,342 MB. Shared memory is 126,512, 49% of total memory.
- Shared memory (globals+routines+gmheap) is 126,512 MB, hugepages is 131,112 MB, gap is 4,600 MB. Shared memory is 96% of huge pages.
- Kernel shared memory limit is at default

Warnings:
- Journal freeze on error is not enabled. If journal IO errors occur database activity that occurs during this period cannot be restored.
- swappiness is 30. For databases 5 is recommended to adjust how aggressive the Linux kernel swaps memory pages to disk.
- dirty_background_ratio is 10 — Maximum percentage of active memory that can be filled with dirty pages before pdflush begins to write them. InterSystems recommends setting this parameter to 5.
- dirty_ratio is 30 — Maximum percentage of total memory that can be filled with dirty pages before processes are forced to write dirty buffers themselves during their time slice instead of being allowed to do more writes. InterSystems recommends setting this parameter to 10. These changes force the Linux pdflush daemon to write out dirty pages more often rather than queue large amounts of updates that can potentially flood the storage with a large burst of updates

Recommendations:
- Review and fix warnings above

All instances on this host:
- >MYSITELIVE         2017.2.2.865.3.1  1972   /isc-hs/MYSITELIVE
```

