import Foundation
//odev 1
var ad : String = "Merve"
var yas : Int = 27
var meslek = "Bilgisayar Mühendisliği"
var kedimVarMi : Bool?
var kediminKilosu : Double? = 4.5
print("Adım : \(ad)")
print("Yasım : \(yas)")
print("Mesleğim : \(meslek)")
if let kilo = kediminKilosu
{
    kedimVarMi = true
    print("Kedim var ve kilosu : \(kilo)")
}
else{
    print("Kedim yok")
}

//odev2
func Toplama(a: Int, b: Int) -> Int {
    return a + b
}
func Cikarma(a: Int, b: Int) -> Int {
    return a - b
}
func Carpma(a: Int, b: Int) -> Int {
    return a * b
}
func Bolme(a: Int, b: Int) -> Int {
    if(b == 0){
        return 0
    }
    return a / b
}
print(Toplama(a: 10, b: 20))
print(Cikarma(a: 10, b: 20))
print(Bolme(a: 20, b: 0))
print(Carpma(a: 2, b: 6))


//Closure kullanarak bir double dizinin siralanmasi
let dizi: [Double] = [1.2, 5.4, 2.3, 4.5, 6.7]
let siralanmisDizi = dizi.sorted { (x, y) -> Bool in
    return x < y
}
print("Sıralanmış dizi : ", siralanmisDizi)

let dizi2 = [1, 5, 2, 4, 6]
let ikidenBuyukOlanlar = dizi2.filter({$0 > 2})
print("2'den büyük olanların dizisi: ",ikidenBuyukOlanlar)
