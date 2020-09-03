function  add_To_Cart(pId,pName,pPrice){
   let cart=localStorage.getItem("cart"); 
    if(cart==null){
        //no cart yet
       let product={ productId:pId,
                    productName:pName,
                    productPrice:pPrice,
                    productQty :1 }; 
        let products=[];
      products.push(product) ;
      localStorage.setItem("cart",JSON.stringify(products));
      console.log("Product added first Time");
    }
    else{
       // cart is already  present 
       let pcart=JSON.parse(cart);
      let oldProduct= pcart.find((item)=>item.productId==pId)
       if(oldProduct)    
       {
          //increase qty
          oldProduct.productQty++;
          pcart.map((item)=>{
              if(item.productId===oldProduct.productId){
                  item.productQty=oldProduct.productQty;
              }
          })
          localStorage.setItem("cart",JSON.stringify(pcart))
          console.log("Product Qty Increased");
       }else{
          //add product to cart 
          let product={ productId:pId,
                    productName:pName,
                    productPrice:pPrice,
                    productQty :1 }; 
                pcart.push(product);
                localStorage.setItem("cart",JSON.stringify(pcart));
                console.log("Product added ");
       }
       
    }
    updateCart();
}
 
//update cart
function updateCart(){
   let cartJson= localStorage.getItem("cart");
   let cart=JSON.parse(cartJson);
   if(cart==null || cart.length==0){
       console.log("Cart is Empty");
       $(".cart-items").html("( 0  )");
       $(".cart-body").html("<h3>Cart doesnot have any Items</h3>");
       $(".checkout-btn").attr("disabled",true);
   }else{
       //
       //cart is not empty
        $(".cart-items").html(`( ${cart.length })`);
       console.log(cart);
       let table=`
    <table class='table'>
     <thead class='thread-light'>
        <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        
        </tr>
                                </thead>
`;
        let totalPrice=0;
        cart.map((item) => {
            
            table= table+ `  
                    <tr>
            <td> ${item.productName}</td>
            <td> ${item.productPrice}</td>
            <td> ${item.productQty}</td>
            <td> ${item.productQty*item.productPrice}</td>
            <td>  <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm' > Remove </button> </td>
            </tr>
            
            `
            totalPrice+=item.productPrice*item.productQty;
        });
        table=table+`  
                <tr> <td colspan='5' class='text-right font-weight-bold' >Total Price : ${ totalPrice}</td> </tr>
                </table>`
        $(".cart-body").html(table);
          $(".checkout-btn").attr("disabled",false);
   }
}
//deletion
function deleteItemFromCart(pId){
    
    let cart = JSON.parse(localStorage.getItem("cart"));
    let filterProduct=cart.filter((item)=> item.productId !=pId )
    localStorage.setItem("cart",JSON.stringify(filterProduct));
    updateCart();
}

$(document).ready(function (){
    updateCart();
});
function check(){
    
    window.location ="checkOut.jsp";
}