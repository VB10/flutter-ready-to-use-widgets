# WidgetSlider
İstediğiniz miktarda widget'ı istediğiniz hızda, dikey veya yatay olarak ekranda kaydırabilirsiniz.
Cache extent parametresinin ekran genişliğinde olmasıyla performans sıkıntısı yaşamayacaksınızdır.

## Çalışma Mantığı

WidgetSlider(
  slideAxis: , --> Axis.horizontal || Axis.vertical <br>
  slideCount: , -->  1 || 100 || 1000000000 istediğiniz kadar max int değerini aşmadığı sürece problem yaşamadan çalıştırabilirsiniz.<br>
  slidingSpeed: , --> Slider'ın her 100ms de alacağı mesafe default olarak 10 değerindedir. Daha smooth geçişler için küçük değerler tavsiye edilir<br>
  spacing: , --> Child'lar arasında ki mesafe<br>
  children: <Widget>[] --> widget türünden nesneler. <br>
  ),<br>


![Ekran Kaydı 2022-05-07 16 14 27](https://user-images.githubusercontent.com/89414084/167256940-56d7d4ed-6fed-49e5-a265-954e58050981.gif)
