package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1413:int;
      
      private var var_1798:int;
      
      private var var_1999:int;
      
      private var var_1840:int;
      
      private var var_1414:int;
      
      private var var_2432:String = "";
      
      private var var_2606:String = "";
      
      private var var_2607:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1413 = param1.readInteger();
         this.var_2432 = param1.readString();
         this.var_1798 = param1.readInteger();
         this.var_1999 = param1.readInteger();
         this.var_1840 = param1.readInteger();
         this.var_1414 = param1.readInteger();
         this.var_2607 = param1.readInteger();
         this.var_2606 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1413;
      }
      
      public function get points() : int
      {
         return this.var_1798;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_1999;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1840;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1414;
      }
      
      public function get badgeID() : String
      {
         return this.var_2432;
      }
      
      public function get achievementID() : int
      {
         return this.var_2607;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2606;
      }
   }
}
