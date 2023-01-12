## Twitter IOS Drawer 
***
### [Veli Bacık](https://github.com/VB10) ' ın youtube dan [Flutter Architecture](https://www.youtube.com/playlist?list=PL1k5oWAuBhgV_XnhMSyu2YLZMZNGuD0Cv) serisi izlendikten sonra core-base (clean arch) mimarisiyle çok daha efektif şekilde kullanılabilir.

* Yol göstermesi amacıyla RootView yapılmış olup, diğer view lar tamamlanmamıştır.
* kullanılacak state managmente göre model yapısı ayarlanır.

örnek klasör yapısı [burada](https://github.com/mysCod3r/flutter_specific_drawer) mevcuttur.

Drawer açılırken:
- app barın tamamen visible olması.
- body nin opacity düşüp body içerisine tıklanamaması
- bottom navigation bar, appbar ve body nin drawer ile birlikte kayması

amaçlanmıştır.

Projede state managment için mobx kullanılmıştır.
```yaml
dependencies:
    flutter_mobx: ^2.0.6+4
     mobx: ^2.1.1
dev_dependencies:
    build_runner: ^2.2.1
    mobx_codegen: ^2.0.7+3
```

<table>
  <tr>
    <td>Custom Side Bar</td>
  </tr>
  
  <tr>
    <td><img src="../../../github/images/custom_drawer/home.jpg" width=270 height=480></td>
    <td><img src="../../../github/images/custom_drawer/drawer.gif" width=270 height=480></td>
    <td><img src="../../../github/images/custom_drawer/drawer.jpg" width=270 height=480></td>
  </tr>
  
</table>