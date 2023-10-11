//2.way-continued ( https://json2apex.herokuapp.com/ bu site jasoni apexe cevirmek icin kullanilan 2. yolda lazim olan parse classinin kodlarini otomatik olusturuyor.O yuzden cok onemli.)

public class RestAnimalParser {

	public List<String> animals;

	
	public static RestAnimalParser parse(String json) {
		return (RestAnimalParser) System.JSON.deserialize(json, RestAnimalParser.class);
	}
}