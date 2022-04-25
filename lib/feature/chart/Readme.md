# BaseChart

Bu grafik yapısı ile verdiğiniz _.csv_ dosyalarındaki verilerle grafik çizimini kolaylaştırıyor.

## Çalışma Mantığı

- Kullanacağımız widget olan BaseChart alacağı parametrelerden en önemlisi **pathCSV** parametresidir. Bu parametreye kullancağımız _.csv_ dosyasının uzun dosya yolu girilir.

- Bu dosyadaki veriler **FileManager** sınıfındaki **getDatas** fonksiyonu ile işlenip **BaseChartModel** tipindeki liste ile geri döner.

- Grafikte kullanacağınız modelin **BaseChartModel**'dan kalıtım alıp xValue ve yValue değerlerine modelinizin kullanacağınız kısımları verilmelidir.

- `List row = line.split(';');` satırında ise benim .csv dosyamdaki veriler **';'** ile ayrıldığından böyle bir yapı kullandım. Siz dosyanıza göre burayı düzenleyebilirsiniz.
