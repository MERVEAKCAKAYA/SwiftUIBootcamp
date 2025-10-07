import CoreData

struct PersistenceController {
    static let shared = PersistenceController() // Singleton yapı
    
    // Core Data konteyneri (veri tabanını temsil eder)
    let container: NSPersistentContainer
    
    // Başlatıcı (initializer)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Odev_8") // ⚠️ Buradaki isim .xcdatamodeld dosya adınla aynı olmalı
        
        if inMemory {
            // Eğer sadece test veya preview içinse veriyi bellekte tut
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        // Persistent store’u yükle
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Core Data yüklenemedi: \(error), \(error.userInfo)")
            }
        }
        
        // Context’in otomatik olarak değişiklikleri kaydetmesini isteyebilirsin (opsiyonel)
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // SwiftUI Preview’ları için örnek veri (isteğe bağlı)
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext
        
        // Örnek veri oluştur
        for i in 1...3 {
            let note = Note(context: context)
            note.id = UUID()
            note.title = "Örnek Not \(i)"
            note.content = "Bu, örnek not \(i)'in içeriğidir."
            note.date = Date()
        }
        
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Örnek veri kaydedilemedi: \(nsError), \(nsError.userInfo)")
        }
        
        return controller
    }()
}
