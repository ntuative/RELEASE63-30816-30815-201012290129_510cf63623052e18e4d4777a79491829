package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1455:String = "pricing_model_unknown";
      
      public static const const_499:String = "pricing_model_single";
      
      public static const const_459:String = "pricing_model_multi";
      
      public static const const_402:String = "pricing_model_bundle";
      
      public static const const_1278:String = "price_type_none";
      
      public static const const_636:String = "price_type_credits";
      
      public static const const_1027:String = "price_type_activitypoints";
      
      public static const const_997:String = "price_type_credits_and_activitypoints";
       
      
      private var var_734:String;
      
      private var var_1131:String;
      
      private var _offerId:int;
      
      private var var_1772:String;
      
      private var var_1133:int;
      
      private var var_1132:int;
      
      private var var_1771:int;
      
      private var var_357:ICatalogPage;
      
      private var var_733:IProductContainer;
      
      private var var_2477:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1772 = param1.localizationId;
         this.var_1133 = param1.priceInCredits;
         this.var_1132 = param1.priceInActivityPoints;
         this.var_1771 = param1.activityPointType;
         this.var_357 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.method_6();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_357;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1772;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1133;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1132;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1771;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_733;
      }
      
      public function get pricingModel() : String
      {
         return this.var_734;
      }
      
      public function get priceType() : String
      {
         return this.var_1131;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2477;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2477 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1772 = "";
         this.var_1133 = 0;
         this.var_1132 = 0;
         this.var_1771 = 0;
         this.var_357 = null;
         if(this.var_733 != null)
         {
            this.var_733.dispose();
            this.var_733 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_734)
         {
            case const_499:
               this.var_733 = new SingleProductContainer(this,param1);
               break;
            case const_459:
               this.var_733 = new MultiProductContainer(this,param1);
               break;
            case const_402:
               this.var_733 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_734);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_734 = const_499;
            }
            else
            {
               this.var_734 = const_459;
            }
         }
         else if(param1.length > 1)
         {
            this.var_734 = const_402;
         }
         else
         {
            this.var_734 = const_1455;
         }
      }
      
      private function method_6() : void
      {
         if(this.var_1133 > 0 && this.var_1132 > 0)
         {
            this.var_1131 = const_997;
         }
         else if(this.var_1133 > 0)
         {
            this.var_1131 = const_636;
         }
         else if(this.var_1132 > 0)
         {
            this.var_1131 = const_1027;
         }
         else
         {
            this.var_1131 = const_1278;
         }
      }
   }
}
