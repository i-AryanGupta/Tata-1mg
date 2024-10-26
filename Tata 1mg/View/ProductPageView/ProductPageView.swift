//
//  ProductPageView.swift
//  Tata 1mg
//
//  Created by Yashom on 24/10/24.
//

import SwiftUI


struct ProductPageView: View {
    @ObservedObject var cartViewModel: CartViewModel // Directly pass CartViewModel
    @ObservedObject var productViewModel: ProductViewModel
    @State private var showCart = false
    let productsFile = ProductsFile()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(productViewModel.product.productImages, id: \.self) { image in
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 1) // Change the color and line width as needed
                                    )
                            }
                        }
                        .padding(.horizontal)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text(productViewModel.product.productName)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(productViewModel.product.productType)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        HStack {
                            Text("₹\(String(format: "%.2f", productViewModel.product.productDiscountedPrice))")
                                .font(.title2)
                                .fontWeight(.bold)

                            Text("₹\(String(format: "%.2f", productViewModel.product.productPrice))")
                                .font(.subheadline)
                                .strikethrough()
                                .foregroundColor(.gray)

                            Text("\(Int((productViewModel.product.productPrice - productViewModel.product.productDiscountedPrice) / productViewModel.product.productPrice * 100))% off")
                                .foregroundColor(.green)
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }

                        Button(action: {
                            cartViewModel.addToCart(product: productViewModel.product)
                        }) {
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    DetailCart()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Product Description")
                            .font(.headline)

                        Text(productViewModel.product.productInformation ?? "No information available.")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Last Minute Buy")
                            .font(.headline)
                            .padding(.leading, 5)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                productStack(for: "Wellness")
                            }
                            .padding(.leading, 5)
                        }

                        Text("Medicine Products")
                            .font(.headline)
                            .padding(.leading, 5)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                productStack(for: "Medicine")
                            }
                            .padding(.leading, 5)
                        }
                    }
                    .padding(.horizontal)
                    
                    BottomImage()
                }
                .padding(.top)
            }
        }
        .navigationBarItems(trailing: cartButton)
        .bgNavLink(content: CartView(cartViewModel: cartViewModel), isAction: $showCart)
    }
    
    func productStack(for type: String) -> some View {
        let filteredProducts = productsFile.productCellData.filter { $0.productType == type }
        return ForEach(filteredProducts) { product in
            ProductCellDataReusable(cartViewModel: cartViewModel, product: product)
                .id(product.id) // Ensure that SwiftUI tracks individual products properly
        }
    }

    private var cartButton: some View {
        Button(action: {
            showCart = true
        }) {
            ZStack {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                
                if cartViewModel.cartItems.count > 0 {
                    Text("\(cartViewModel.cartItems.count)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20)
                        .background(Color.orange)
                        .clipShape(Circle())
                        .offset(x: 10, y: -10)
                }
            }
        }
    }
}



 //Preview
struct ProductPageView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample CartViewModel for the preview
        let sampleCartViewModel = CartViewModel()

        // Create a sample product
        let sampleProduct = ProductCellData(
            productName: "Azithromycin",
            productImages: ["azit1", "azit2"],
            productPrice: 150.30,
            productDiscountedPrice: 100.00,
            productType: "Medicine",
            productInformation: """
            Azithromycin is a widely used antibiotic that is particularly effective against a broad range of bacterial infections. It belongs to the macrolide class of antibiotics and works by preventing bacteria from growing by interfering with their protein synthesis. Azithromycin is commonly prescribed for respiratory tract infections, including pneumonia, bronchitis, sinusitis, as well as ear infections, skin infections, and sexually transmitted infections such as chlamydia.
            """
        )

        // Pass the product and the CartViewModel to the ProductPageView preview
        return ProductPageView(cartViewModel: sampleCartViewModel, productViewModel: ProductViewModel(product: sampleProduct))
                    
            }
}
