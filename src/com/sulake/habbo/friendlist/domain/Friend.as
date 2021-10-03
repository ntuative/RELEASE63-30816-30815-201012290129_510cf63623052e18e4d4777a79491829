package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_1675:int = "F".charCodeAt(0);
      
      public static const const_1803:int = "M".charCodeAt(0);
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_849:int;
      
      private var var_663:Boolean;
      
      private var var_1733:Boolean;
      
      private var var_561:String;
      
      private var var_1867:String;
      
      private var var_1511:String;
      
      private var var_1345:int;
      
      private var var_176:Boolean;
      
      private var _disposed:Boolean;
      
      private var _view:IWindowContainer;
      
      private var var_1165:BitmapData;
      
      private var var_1510:String;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._id = param1.id;
         this._name = param1.name;
         this.var_849 = param1.gender;
         this.var_663 = param1.online;
         this.var_1733 = param1.followingAllowed && param1.online;
         this.var_561 = param1.figure;
         this.var_1867 = param1.motto;
         this.var_1511 = param1.lastAccess;
         this.var_1345 = param1.categoryId;
         this.var_1510 = param1.realName;
         Logger.log("Creating friend: " + this.id + ", " + this.name + ", " + this.gender + ", " + this.online + ", " + this.followingAllowed + ", " + this.figure + ", " + this.categoryId);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_1165 != null)
         {
            this.var_1165.dispose();
            this.var_1165 = null;
         }
         this._disposed = true;
         this._view = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
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
      
      public function get motto() : String
      {
         return this.var_1867;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1511;
      }
      
      public function get categoryId() : int
      {
         return this.var_1345;
      }
      
      public function get selected() : Boolean
      {
         return this.var_176;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function get face() : BitmapData
      {
         return this.var_1165;
      }
      
      public function get realName() : String
      {
         return this.var_1510;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_849 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_663 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1733 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_561 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1867 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1511 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1345 = param1;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_176 = param1;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function set face(param1:BitmapData) : void
      {
         this.var_1165 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1510 = param1;
      }
   }
}
