##  A/B测试Swift版本
按照[SkyLab](https://github.com/mattt/SkyLab)的思路，来了个简易的Swift版本，只能接收Array类型的conditions😅，就是测试一下。

看了SkyLab的源码，认为A/B测试的大致思路就是：
- App启动后，检测本地的测试方案。
- 如果本地已经存储了测试方案，那么沿用之前的方案就完事了。
- 如果之前没有方案，那么随机选择一个方案来使用，并且保存下来。

