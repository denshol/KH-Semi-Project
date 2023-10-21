package com.semi.event.totalDiscount;



//모든 할인을 위한 기본 클래스 정의
abstract class Discount {
abstract double applyDiscount(double amount);
}

//멤버십 레벨 할인 클래스 정의
class MembershipDiscount extends Discount {
private int memberGrade;

public MembershipDiscount(int memberGrade) {
	 System.out.println();
   this.memberGrade = memberGrade;
}

@Override
double applyDiscount(double amount) {
   // 멤버십 레벨 할인 로직 구현
   double discountPercentage = 0.0;
   switch (memberGrade) {
       case 1:
           discountPercentage = 0.05;
           break;
       case 2:
           discountPercentage = 0.10;
           break;
       case 3:
           discountPercentage = 0.15;
           break;
       default:
           discountPercentage = 0.0;
           break;
   }
   return amount * (1 - discountPercentage);
}
}

//프로모션 할인 이벤트 클래스 정의
class PromotionDiscount extends Discount {
private double discountPercentage;

public PromotionDiscount(double discountPercentage) {
   this.discountPercentage = discountPercentage;
}

@Override
double applyDiscount(double amount) {
   // 프로모션 할인 로직 구현
   return amount * (1 - discountPercentage);
}
}

//쿠폰 할인 클래스 정의
class CouponDiscount extends Discount {
private double couponAmount;

public CouponDiscount(double couponAmount) {
   this.couponAmount = couponAmount;
}

@Override
double applyDiscount(double amount) {
   // 쿠폰 할인 로직 구현
   return amount - couponAmount;
}
}

//예시 사용법
public class DiscountCalculator {
public static void main(String[] args) {
   double amount = 100.0; // 원래 가격

   // 멤버십 레벨 할인 적용
   Discount membershipDiscount = new MembershipDiscount(2);
   amount = membershipDiscount.applyDiscount(amount);

   // 프로모션 할인 적용
   Discount promotionDiscount = new PromotionDiscount(0.20);
   amount = promotionDiscount.applyDiscount(amount);

   // 쿠폰 할인 적용
   Discount couponDiscount = new CouponDiscount(10.0);
   amount = couponDiscount.applyDiscount(amount);

   System.out.println("최종 할인 적용 후 금액: $" + amount);
   
   amount = 100.0;
   // 다형성을 이용하여 할인들을 배열로 관리
   Discount[] discounts = new Discount[3];
   discounts[0] = new MembershipDiscount(2);
   discounts[1] = new PromotionDiscount(0.20);
   discounts[2] = new CouponDiscount(10.0);

   // 모든 할인 적용
   for (Discount discount : discounts) {
       amount = discount.applyDiscount(amount);
   }

   System.out.println("최종 할인 적용 후 금액: $" + amount);
}
}
