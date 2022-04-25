# BaseChart

Bu grafik yapısı ile verdiğiniz _.csv_ dosyalarındaki verilerle grafik çizimini kolaylaştırıyor. Daha detaylı anlattığım makalesine [buradan](https://burakimdat.medium.com/fluttera-csv-dosyas%C4%B1ndaki-veriyle-grafik-%C3%A7izme-e3fdc7fd4f0) ulaşabilirsiniz

## Çalışma Mantığı

- Kullanacağımız widget olan BaseChart alacağı parametrelerden en önemlisi **pathCSV** parametresidir. Bu parametreye kullancağımız _.csv_ dosyasının uzun dosya yolu girilir.

- Bu dosyadaki veriler **FileManager** sınıfındaki **getDatas** fonksiyonu ile işlenip **BaseChartModel** tipindeki liste ile geri döner.

- Grafikte kullanacağınız modelin **BaseChartModel**'dan kalıtım alıp xValue ve yValue değerlerine modelinizin kullanacağınız kısımları verilmelidir.

- `List row = line.split(';');` satırında ise benim .csv dosyamdaki veriler **';'** ile ayrıldığından böyle bir yapı kullandım. Siz dosyanıza göre burayı düzenleyebilirsiniz.


<p float="left">
  <img src="https://user-images.githubusercontent.com/70351342/165073783-a63f2b0d-5f28-49bb-a1f3-40eeb310046e.png" width="207" height="448">
  <img src="https://user-images.githubusercontent.com/70351342/165073894-52fef303-bbb2-4e58-b1dc-4dfeb3522fc9.png" width="109" height="448">
</p>
