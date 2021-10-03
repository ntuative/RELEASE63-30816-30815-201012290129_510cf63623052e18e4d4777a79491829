package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1712:int = 1;
      
      public static const const_1486:int = 2;
       
      
      private var var_886:String;
      
      private var var_2532:int;
      
      private var var_2527:int;
      
      private var var_2531:int;
      
      private var var_2533:int;
      
      private var var_2528:Boolean;
      
      private var var_2002:Boolean;
      
      private var var_2176:int;
      
      private var var_2175:int;
      
      private var var_2530:Boolean;
      
      private var var_2526:int;
      
      private var var_2529:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_886 = param1.readString();
         this.var_2532 = param1.readInteger();
         this.var_2527 = param1.readInteger();
         this.var_2531 = param1.readInteger();
         this.var_2533 = param1.readInteger();
         this.var_2528 = param1.readBoolean();
         this.var_2002 = param1.readBoolean();
         this.var_2176 = param1.readInteger();
         this.var_2175 = param1.readInteger();
         this.var_2530 = param1.readBoolean();
         this.var_2526 = param1.readInteger();
         this.var_2529 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_886;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2532;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2527;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2531;
      }
      
      public function get responseType() : int
      {
         return this.var_2533;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2528;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2002;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2176;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2175;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2530;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2526;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2529;
      }
   }
}
