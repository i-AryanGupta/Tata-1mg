//
//  Product.swift
//  Tata 1mg
//
//  Created by Yashom on 18/10/24.
//

import Foundation

// ProductCellData represents a product, using a struct for immutability and efficiency
struct ProductCellData: Identifiable {
    var id: String = UUID().uuidString
    var productName: String
    var productImages: [String]
    var productPrice: Double
    var productDiscountedPrice: Double
    var deliveryDate: String = "Delivery by 11pm today"
    var productType: String
    var productInformation: String?

    
    init(productName: String, productImages: [String], productPrice: Double, productDiscountedPrice: Double, productType: String, productInformation: String? = nil) {
        self.productName = productName
        self.productImages = productImages
        self.productPrice = productPrice
        self.productDiscountedPrice = productDiscountedPrice
        self.productType = productType
        self.productInformation = productInformation
    }
}

class ProductsFile {
    var productCellData: [ProductCellData] = [
        ProductCellData(productName: "Azithromycin",
                        productImages: ["azit1", "azit2", "azit1"],
                        productPrice: 150.30,
                        productDiscountedPrice: 100.00,
                        productType: "Medicine",
                        productInformation: """
                        Product Information:
                        Azithromycin is a widely used antibiotic that is particularly effective against a broad range of bacterial infections. It belongs to the macrolide class of antibiotics and works by preventing bacteria from growing by interfering with their protein synthesis. Azithromycin is commonly prescribed for respiratory tract infections, including pneumonia, bronchitis, sinusitis, as well as ear infections, skin infections, and sexually transmitted infections such as chlamydia.
                        
                        Uses:
                        - Treatment of respiratory tract infections, including bacterial bronchitis and pneumonia.
                        - Skin infections caused by susceptible bacteria.
                        - Treatment of ear infections in children and adults.
                        - Effective against sexually transmitted infections, especially chlamydia and gonorrhea.
                        
                        Dosage:
                        The typical dosage is 500 mg on the first day followed by 250 mg once daily for the next 4 days. However, dosing may vary based on the infection type and patient condition. Always follow the prescribed guidelines from a healthcare professional.

                        Precautions:
                        - Do not use in patients with a history of allergic reactions to macrolide antibiotics.
                        - Patients with liver disease should inform their doctor before taking this medication, as it is processed through the liver.
                        
                        Side Effects:
                        Some common side effects include:
                        - Nausea and vomiting
                        - Diarrhea or stomach discomfort
                        - Dizziness or mild headache
                        Rare side effects may include allergic reactions, including rash or difficulty breathing.
                        """),

        
        ProductCellData(productName: "Vicks",
                        productImages: ["vivks1","vivks1","vivks1"],
                        productPrice: 122.70,
                        productDiscountedPrice: 99.00,
                        productType: "Medicine",
                        productInformation: """
                        Product Information:
                        Vicks Vaporub is a topical ointment that provides temporary relief from cough, nasal congestion, and muscle aches due to colds. Its main ingredients include menthol, camphor, and eucalyptus oil, which work together to create a soothing sensation and open the airways, making breathing easier.
                        
                        Uses:
                        - Temporary relief from symptoms of cold, including nasal congestion, cough, and minor muscle aches.
                        - Can be applied on the chest, back, and throat for congestion relief.
                        
                        Application:
                        - For nasal congestion: Apply to the chest and throat up to 3 times a day.
                        - For muscle aches: Rub on the affected muscles to relieve soreness.
                        
                        Precautions:
                        - Avoid applying near the eyes, mouth, or nostrils.
                        - Not recommended for children under 2 years old unless prescribed by a doctor.
                        
                        Side Effects:
                        - Some users may experience a mild burning sensation or skin irritation at the site of application.
                        - In rare cases, allergic reactions such as rash or hives may occur.
                        """),

        
        ProductCellData(productName: "MamaEarth",
                        productImages: ["mama","mama","mama"],
                        productPrice: 250.30,
                        productDiscountedPrice: 199.00,
                        productType: "Wellness",
                        productInformation: """
                        Product Information:
                        MamaEarth Skin Cream is a natural, toxin-free cream designed to nourish and moisturize the skin. Infused with natural ingredients such as aloe vera, turmeric, and shea butter, this cream helps restore the skin's moisture balance, making it soft and smooth. It is dermatologically tested and free from harmful chemicals like parabens, sulfates, and artificial fragrances, making it safe for all skin types, including sensitive skin.
                        
                        Uses:
                        - Deep hydration for dry, flaky skin.
                        - Can be used daily as a part of your skincare routine to prevent dryness and keep skin soft.
                        - Suitable for all skin types, especially for individuals with sensitive skin.
                        
                        Application:
                        - Apply a generous amount to clean skin and massage gently in circular motions until fully absorbed.
                        - Use twice a day for best results, especially after bathing or before bedtime.
                        
                        Precautions:
                        - Avoid contact with eyes; in case of irritation, rinse with cold water.
                        - Perform a patch test before first use if you have sensitive skin.

                        Side Effects:
                        - Generally considered safe, but individuals with very sensitive skin may experience slight irritation.
                        """),

        
        ProductCellData(productName: "Move",
                        productImages: ["move1"],
                        productPrice: 180.30,
                        productDiscountedPrice: 149.99,
                        productType: "Medicine",
                        productInformation: """
                        Product Information:
                        Move is a topical pain relief gel specifically formulated to relieve muscle pain, joint pain, and back pain. It contains ingredients like menthol, camphor, and methyl salicylate, which provide a cooling sensation followed by warmth to relieve deep-seated aches and pains. It's commonly used by athletes, the elderly, and anyone suffering from minor muscle strains and joint issues.

                        Uses:
                        - Muscle pain relief for sprains, strains, and injuries.
                        - Joint pain relief for arthritis or osteoarthritis.
                        - Can be used for lower back pain and stiffness.
                        
                        Application:
                        - Apply a thin layer of Move gel to the affected area and massage gently.
                        - Use up to 3-4 times a day, depending on the severity of the pain.

                        Precautions:
                        - For external use only; avoid contact with eyes and mucous membranes.
                        - Do not use on broken or irritated skin.
                        - Pregnant women should consult a doctor before using.

                        Side Effects:
                        - Temporary redness or warmth at the site of application.
                        - Mild irritation or allergic reactions may occur in sensitive individuals.
                        """),

        
        ProductCellData(productName: "Pill",
                        productImages: ["pills2", "pills1", "pills3"],
                        productPrice: 150.30,
                        productDiscountedPrice: 125.30,
                        productType: "Medicine",
                        productInformation: """
                        Product Information:
                        This generic pain relief pill contains paracetamol (acetaminophen), one of the most commonly used medications for pain relief and fever reduction. It is effective in treating mild to moderate pain such as headaches, muscle pain, toothaches, and menstrual cramps. Paracetamol is known for its safety profile when used within the recommended dosage.

                        Uses:
                        - Pain relief for conditions such as headaches, muscle aches, and arthritis.
                        - Fever reduction in cases of cold or flu.
                        
                        Dosage:
                        Adults: 500 mg to 1,000 mg every 4 to 6 hours as needed, but do not exceed 4,000 mg in 24 hours.
                        Always follow the dosage instructions provided by a healthcare professional.

                        Precautions:
                        - Do not take more than the recommended dosage, as it can cause liver damage.
                        - Avoid alcohol while taking this medication as it increases the risk of liver toxicity.

                        Side Effects:
                        - Generally safe, but overuse can lead to liver damage.
                        - In rare cases, allergic reactions such as rash or swelling may occur.
                        """),

        
        ProductCellData(productName: "Sunscreen",
                        productImages: ["sunscreen"],
                        productPrice: 260.30,
                        productDiscountedPrice: 220.49,
                        productType: "Wellness",
                        productInformation: """
                        Product Information:
                        This broad-spectrum sunscreen provides effective protection against both UVA and UVB rays, which are known to cause sunburn, premature aging, and skin cancer. The formula contains SPF 50, ensuring high protection during sun exposure. It's lightweight, non-greasy, and water-resistant, making it ideal for daily use.

                        Uses:
                        - Sun protection to prevent sunburn and reduce the risk of skin cancer.
                        - Helps protect the skin from the harmful effects of UVA and UVB rays.

                        Application:
                        - Apply generously to all exposed skin 15 minutes before sun exposure.
                        - Reapply every 2 hours or after swimming, sweating, or towel drying.

                        Precautions:
                        - For external use only; avoid contact with eyes.
                        - If irritation occurs, discontinue use.

                        Side Effects:
                        - Rare, but some individuals may experience mild irritation or allergic reactions.
                        """),

    ]
}
