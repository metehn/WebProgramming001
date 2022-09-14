package com.metehan.webprogramming001.inventory.entity;

import lombok.*;

@Getter
@Setter
@RequiredArgsConstructor
@NoArgsConstructor
public class Product {

    @NonNull
    private long productId;
    @NonNull
    private String productName;
    @NonNull
    private double productPrice;

    private long categoryId;
    private String categoryName;

}
