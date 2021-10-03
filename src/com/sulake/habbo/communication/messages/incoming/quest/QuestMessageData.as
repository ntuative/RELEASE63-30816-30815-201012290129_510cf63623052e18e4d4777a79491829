package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var _id:int;
      
      private var _status:int;
      
      private var _type:String;
      
      private var var_1516:String;
      
      private var var_1519:int;
      
      private var var_1517:String;
      
      private var _localizationCode:String;
      
      private var var_1518:String;
      
      private var var_2073:uint;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._status = param1.readInteger();
         this._type = param1.readString();
         this.var_1516 = param1.readString();
         this.var_1519 = param1.readInteger();
         this.var_1517 = param1.readString();
         this._localizationCode = param1.readString();
         var _loc2_:String = "";
         var _loc3_:int = this._localizationCode.length - 1;
         while(_loc3_ > 0 && this.isNumber(this._localizationCode.charAt(_loc3_)))
         {
            _loc2_ = this._localizationCode.charAt(_loc3_) + _loc2_;
            _loc3_--;
         }
         if(_loc3_ > 0)
         {
            this.var_1518 = this._localizationCode.substring(0,_loc3_ + 1);
         }
         else
         {
            this.var_1518 = this._localizationCode;
         }
         this.var_2073 = uint(_loc2_);
      }
      
      private function getNumber(param1:String) : int
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ - 48;
      }
      
      private function isNumber(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._status = 0;
         this._type = "";
         this.var_1516 = "";
         this.var_1519 = 0;
         this.var_1517 = "";
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1516;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1519;
      }
      
      public function get endDateTimeStamp() : String
      {
         return this.var_1517;
      }
      
      public function get localizationCode() : String
      {
         return this._localizationCode;
      }
      
      public function get sortCode() : uint
      {
         return this.var_2073;
      }
      
      public function get localizationPrefix() : String
      {
         return this.var_1518;
      }
   }
}
