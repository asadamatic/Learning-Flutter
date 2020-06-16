class PlaceData {


  String title, description, imageUrl, credits, creditsUrl;

  PlaceData({this.title, this.description, this.imageUrl, this.credits, this.creditsUrl});
}

class PlaceList {

  List<PlaceData> places = [
    PlaceData(title: 'Gilgit Baltistan', description: "Gilgit Baltistan is the capital of tourism in Pakistan. "
        "Gilgit Baltistan is home to some of the highest peaks in the world, including K2 the second highest peak in the world. Gilgit Baltistan's landscape includes mountains, lakes, glaciers and valleys."
        " Gilgit Baltistan is not only known for its mountains — it is also visited for its landmarks, culture, history and people. K2 Basecamp, Deosai, Naltar, Fairy Meadows Bagrot Valley and Hushe valley are common places to visit in Gilgit Baltistan.", imageUrl: 'Assets/gilgit.jpg', credits: 'Rizwan Saeed', creditsUrl: 'https://unsplash.com/@dilshad3'),
    PlaceData(title: 'Balochistan', description: "Balochistan is the largest province by geographical area of Pakistan, constituting approximately 43% of the total area. "
        "Balochistan is home to one of the oldest Neolithic (7000 BC to c. 2500 BC) sites in archaeology. Mehrgarh and Nausharo was an ancient city linked to the Indus Valley Civilization. Ancient sites dating back 800 years are the Nausherwani tombs at Qila Ladgasht. "
        "There was also an ancient port at the site of Oraea which proved to be a useful port during the Hellenistic civilisation.", imageUrl: 'Assets/balochistan.jpg', credits: 'Zohaib Khan', creditsUrl: 'https://unsplash.com/@mzuhaibk'),
    PlaceData(title: 'Punjadb', description: "Punjab is the second largest province in Pakistan. "
        "It is known for its ancient cultural heritage as well as its religious diversity. The lands of Punjab have been home to a number of religions and civilisations. "
        "The Indus Valley Civilization once ruled the region and a significant archaeological find was discovered at the ancient city of Harrapa. The Gandhara civilisation was also quite dominant in the northern region of Punjab at the site of Taxila. "
        "Several other civilisations such as Greeks, Central Asians, and Persians ruled Punjab leaving a number of sites which still exist today.", imageUrl: 'Assets/punjab.jpg', credits: 'Sharjeel Khalid', creditsUrl: 'https://unsplash.com/@sharjeel_khalid'),
    PlaceData(title: 'Khyber Pakhtunkhwa', description: "Khyber Pakhtunkhwa is located in the north-west region of Pakistan. "
        "It is known as the tourist hotspot for adventurers and explorers. The province has a varied landscape ranging from rugged mountains, valleys, hills and dense agricultural farms. The region is well known for its ancestral roots. "
        "There are a number of Buddhist archaeological sites from the Gandhara civilisation such as Takht Bhai and Pushkalavati. "
        "There are a number of other Buddhist and Hindu archaeological sites including Bala Hisar Fort, Butkara Stupa, Kanishka stupa, Chakdara, Panjkora Valley and Sehri Bahlol.", imageUrl: 'Assets/kpk.jpg', credits: 'Sabeer Darr', creditsUrl: 'https://unsplash.com/@sabeerdarr'),
    PlaceData(title: 'Sindh', description: "Sindh is located in the south-eastern region of Pakistan. "
        "The province is known for its religious heritage and rapid-urbanisation. The province is home to the ancient Indus Valley Civilisation. "
        "Mohenjo-daro near the city of Larkana was one of the largest city-settlements in South Asia and is an official UNESCO World Heritage Site. "
        "The Chaukhandi tombs are another example of ancient Sindhi and Balochi heritage located near the town of Landi."
        " Another ancient city, Aror, located near the city of Sukkur is also a tourist spot known for its ruins."
        " Kahu-Jo-Darro is an ancient Buddhist archaeological site near Mirpurkhas were a Buddhist stupa was excavated.", imageUrl: 'Assets/sindh.jpg', credits: 'Nazim Laghari', creditsUrl: 'https://unsplash.com/@nazimlaghari'),
    PlaceData(title: 'Azad Kashmir', description: "Azad Kashmir is the region of Pakistan situated in Northern part of the country. "
        "The northern part of Azad Jammu and Kashmir encompasses the lower part of the Himalayas, including Jamgarh Peak 4,734 metres (15,531 ft). However, Sarwali peak in the Neelum Valley is the highest peak in the state."
        " Ganga Choti is the peak in Bagh. Fertile, green, mountainous valleys are characteristic of Azad Kashmir's geography.", imageUrl: 'Assets/kashmir.jpeg', credits: "Ranzo D'Souza", creditsUrl: 'https://unsplash.com/@renzods'),
    PlaceData(title: 'Islambad', description: "Islamabad is the capital of Pakistan."
        " Islamabad is located in the Pothohar Plateau in the northeastern part of the country, between Rawalpindi District and the Margalla Hills National Park to the north. "
        "The region has historically been a part of the crossroads of Punjab and Khyber Pakhtunkhwa with the Margalla Pass acting as the gateway between the two regions. "
        "Faisal Mosque (the largest mosque in South Asia), Margalla Hills National Park, Daman-i-Koh, Pakistan Monument, Rawal Lake, Simli Lake and Fatima Jinnah Park are among the tourists places which are located in Islamabad."
        " It is ranked as the 2nd most beautiful capital city in the world.", imageUrl: 'Assets/islamabad.jpg', credits: 'Syed Bilal Javaid', creditsUrl: 'https://unsplash.com/@sbjshah')];




  List getList(){

    return places;
  }
}