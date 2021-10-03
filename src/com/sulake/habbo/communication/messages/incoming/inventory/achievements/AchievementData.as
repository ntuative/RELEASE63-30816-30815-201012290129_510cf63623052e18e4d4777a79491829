package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1413:int;
      
      private var var_288:String;
      
      private var var_2000:int;
      
      private var var_1999:int;
      
      private var var_1840:int;
      
      private var var_1998:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1413 = param1.readInteger();
         this.var_288 = param1.readString();
         this.var_2000 = param1.readInteger();
         this.var_1999 = param1.readInteger();
         this.var_1840 = param1.readInteger();
         this.var_1998 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_288;
      }
      
      public function get level() : int
      {
         return this.var_1413;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2000;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_1999;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1840;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1998;
      }
   }
}
