package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_849:int;
      
      private var var_663:Boolean;
      
      private var var_1733:Boolean;
      
      private var var_561:String;
      
      private var var_1345:int;
      
      private var var_1867:String;
      
      private var var_1511:String;
      
      private var var_1510:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_849 = param1.readInteger();
         this.var_663 = param1.readBoolean();
         this.var_1733 = param1.readBoolean();
         this.var_561 = param1.readString();
         this.var_1345 = param1.readInteger();
         this.var_1867 = param1.readString();
         this.var_1511 = param1.readString();
         this.var_1510 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_849;
      }
      
      public function get online() : Boolean
      {
         return this.var_663;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1733;
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function get categoryId() : int
      {
         return this.var_1345;
      }
      
      public function get motto() : String
      {
         return this.var_1867;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1511;
      }
      
      public function get realName() : String
      {
         return this.var_1510;
      }
   }
}
