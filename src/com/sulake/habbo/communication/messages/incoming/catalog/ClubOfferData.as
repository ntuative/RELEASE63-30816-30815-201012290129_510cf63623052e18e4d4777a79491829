package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1453:String;
      
      private var var_1454:int;
      
      private var var_1943:Boolean;
      
      private var var_1944:Boolean;
      
      private var var_1950:int;
      
      private var var_1948:int;
      
      private var var_1949:int;
      
      private var var_1946:int;
      
      private var var_1945:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1453 = param1.readString();
         this.var_1454 = param1.readInteger();
         this.var_1943 = param1.readBoolean();
         this.var_1944 = param1.readBoolean();
         this.var_1950 = param1.readInteger();
         this.var_1948 = param1.readInteger();
         this.var_1949 = param1.readInteger();
         this.var_1946 = param1.readInteger();
         this.var_1945 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1453;
      }
      
      public function get price() : int
      {
         return this.var_1454;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_1943;
      }
      
      public function get vip() : Boolean
      {
         return this.var_1944;
      }
      
      public function get periods() : int
      {
         return this.var_1950;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_1948;
      }
      
      public function get year() : int
      {
         return this.var_1949;
      }
      
      public function get month() : int
      {
         return this.var_1946;
      }
      
      public function get day() : int
      {
         return this.var_1945;
      }
   }
}
