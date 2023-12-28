import 'package:my_application/models/onboard_model.dart';

class OnboardItems {
  late final List<OnboardModel> screens;

  OnboardItems() {
    screens = <OnboardModel>[
      OnboardModel(
        img: 'assets/images/image1.png',
        text: "ToDo Uygulaması",
        desc: "Kendi yapılacaklar listeni oluştur",
      ),
      OnboardModel(
        img: 'assets/images/image2.png',
        text: "Görevleri Tamamla",
        desc: "Tamamlanan görevleri yapıldı olarak işaretle",
      ),
      OnboardModel(
        img: 'assets/images/image6.png',
        text: "Görev Ekle",
        desc: "İstediğin gibi yeni görevler ekle",
      ),
      OnboardModel(
        img: 'assets/images/image7.png',
        text: "Görev Sil",
        desc: "Tamamlanan görevleri sil",
      ),
      OnboardModel(
        img: 'assets/images/image5.png',
        text: "Tema",
        desc: "Tema ayarlarından istediğin rengi seç ve uygulamanın keyfini çıkar",
      ),
      OnboardModel(
        img: 'assets/images/image3.png',
        text: "Tema",
        desc: "",
      ),
      OnboardModel(
        img: 'assets/images/image4.png',
        text: "Tema",
        desc: "",
      ),
    ];
  }
}
