## Assignment Two

519021910071 陈文迪

#### Review Question 5.3

DRAM主要用于主存，而SRAM主要用于cache。

#### Review Question 5.4

动态存储单元一般比静态存储单元更简单也更小，因此与对应的SRAM相比，DRAM的密度更高，单位面积拥有的单元更多，因此价格更低。并且，对于大容量存储器，DRAM刷新电路所需成本完全可以由更少的制造成本所补偿，因此DRAM制造的存储器往往容量更大。此外，SRAM由于其通过on/off switch来存储信息，其速度会比DRAM更快。

#### Problem 5.3

a. $\text{memory cycle time}=60ns+40ns=100ns$。$\text{maximum data rate}=\frac{1s}{100ns}\times 1bit = 10Mbps$。

b. $\text{data transfer rate}=32\times 10Mbps=320Mbps=40MB/s$。

#### Problem 5.4

由于每个1-Mbyte芯片内都是按字寻址，字长为1byte，因此需要20位来表示芯片内地址（A0~A

19）。同时我们有8个芯片，因此需要3位来表示选择哪个芯片（A20~A22）。

![](D:\PersonalFile\courses\EI209-Computer-Organization\Assignment\Assignment 2\5.4.png)

#### Problem 5.8

总共需要$\frac{8192}{64}=128$个芯片。可以按照如下方式组织：先用16个芯片位扩展至16bit，利用一个地址位（A0）来区分是高八位还是低八位；由于每个芯片内有64bit，因此需要5位地址位来寻址（A1~A6）；最后进行字扩展，共需要8个类似的芯片组因此需要3位地址位（A7~A9）。

![](D:\PersonalFile\courses\EI209-Computer-Organization\Assignment\Assignment 2\5.8.png)

#### Review Question 7.3

I/O模块的主要功能有如下几个：

- 控制与计时（Control and timing）
- 处理器通讯（Processor communication）
- 设备通讯（Device communication）
- 数据缓存（Data buffering）
- 错误检测（Error Detection）

#### Review Question 7.4

主要有三种I/O技术：Programmed I/O，Interrupt driven I/O 和 DMA（Direct Memory Access）。对于Programmed I/O，处理器执行一个程序来直接控制I/O操作，包括检测设备状态、向I/O模块发送读/写命令或是传送数据；当处理器向I/O模块发出命令时，它必须等待I/O操作完成。对于Interrupt driven I/O，其克服了CPU需要等待I/O完成这一问题，当I/O设备工作时，CPU可以继续执行其他不依赖于I/O的指令而不需要让CPU不断确认设备，当I/O完成后I/O模块再发送中断信号来中断CPU。以上两种方式都需要CPU的介入，而DMA通过在总线上增加一个新的硬件模块（DMA controller）来让DMA控制器接管CPU有关I/O的工作，CPU先向DMA模块发送请求并发送所需信息，接着CPU可以继续其他工作而由DMA负责数据传输，当传输完成后DMA控制器再发送中断通知CPU。

#### Review Question 7.5

对于Memory mapped I/O，设备和内存共享一块地址空间，一切I/O操作就类似于内存的读/写，同时不需要设计对于I/O的特殊指令。而对于Isolated I/O，设备和内存的地址空间是独立的，并且需要设计I/O和内存的选择线路，同时需要为I/O提供特殊指令。

#### Review Question 7.6

共有四种解决方法：为每个模块建立独立的线路；使用软件轮询的方式，当中断发生时，CPU一次询问各模块；使用Daisy Chain或硬件轮询的方式；Bus Master，任何模块在发起中断之前必须申请总线的控制权。

#### Review Question 7.7

由于Cycle Stealing机制，当DMA需要使用总线时，处理器会被挂起一个总线周期。

#### Problem 7.6

a. 由于扫描时间的限制，实际上向打印机的传输速率为$\frac{1s}{200ms}*1character=5cps$。

b. 因为只有一个字符的缓冲区，所以扫描频率至少应该为60ms一次。

#### Problem 7.8

优点：其一，我们不需要设计I/O和memory的选择线路，使得CPU本身的结构更加简单；其二，可以充分复用指令集中的寻址指令来进行操作，并且可以充分利用寄存器等存储设备，使得寻址过程更加统一和灵活。

缺点：其一，在大多数设备中内存访问的指令会比I/O操作更加复杂，也更长，这就导致采用memory-mapped I/O增加了程序的长度，增加了程序本身的存储空间；其二，由于需要额外的原件来进行寻址，增加了外部电路的设计难度和复杂性。

#### Problem 7.10

a. 由于每字节要产生一次中断，所以每秒钟需要产生8192次中断，其中每次中断有100μs花费在中断处理上。因此，$\text{fraction of processor time}=\frac{100\mu s}{1s/8192}=81.92\%$。

b. 由于缓冲的存在，现在每秒中会发生$\frac{8196}{16}=512$次中断，每次中断所花费时间为$100\mu s+15\times 8\mu s=220\mu s$。因此，$\text{fraction of processor time}=\frac{220\mu s}{1s/512}=11.264\%$。

c. 每次中断所花费时间为$220\mu s-16\times 6\mu s=124\mu s$。因此，$\text{fraction of processor time}=\frac{124\mu s}{1s/512}=6.3488\%$。

#### Problem 7.12

DMA的传输速率为$9600bps=1200\text{ Byte per second}$，原本CPU的fetching rate(FR)为$10^6\text{ per second}$，由于DMA的Cycle Stealing，现在的FR为$10^6-1200\text{ per second}$，因此CPU速度被降低了$\frac{1200}{10^6}=0.12\%$。

