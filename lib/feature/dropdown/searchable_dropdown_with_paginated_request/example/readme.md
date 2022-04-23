# SearchableDropdownWithPaginatedRequest

Ben bu widget'ın bulunduğu projede getx kullandığım için getx'in özelliklerini kullanarak geliştirmiştim.
Buraya atarken vanilya olarak atmaya çalıştım, umarım bir bug çıkmaz :)

Basit olarak DropDown widgetımız verdiğimiz pagination olan servis isteğini kendi içinde handle edip bize seçimi döndürüyor.

Yapılması gerekenler**
-Dropdown'a verdiğiniz sınıf base modelden türemelidir.
-Dropdown'ın controllerındaki getRequest fonksiyonununun verileri ele alma biçimi sizin apinizin paginationlı veri gönderme biçimine uyarlanması gerekmektedir, ilgili kısımda bir comment bulunmaktadır.
