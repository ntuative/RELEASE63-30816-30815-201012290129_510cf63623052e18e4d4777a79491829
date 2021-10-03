package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_340:int = 1;
      
      public static const const_225:int = 2;
      
      public static const const_262:int = 3;
      
      public static const const_323:int = 4;
      
      public static const const_248:int = 5;
      
      public static const const_381:int = 1;
      
      public static const const_808:int = 2;
      
      public static const const_721:int = 3;
      
      public static const const_586:int = 4;
      
      public static const const_239:int = 5;
      
      public static const const_802:int = 6;
      
      public static const const_660:int = 7;
      
      public static const const_223:int = 8;
      
      public static const const_326:int = 9;
      
      public static const const_1639:int = 10;
      
      public static const const_642:int = 11;
      
      public static const const_410:int = 12;
       
      
      private var var_366:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_366 = new Array();
         this.var_366.push(new Tab(this._navigator,const_340,const_410,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_431));
         this.var_366.push(new Tab(this._navigator,const_225,const_381,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_431));
         this.var_366.push(new Tab(this._navigator,const_323,const_642,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1083));
         this.var_366.push(new Tab(this._navigator,const_262,const_239,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_431));
         this.var_366.push(new Tab(this._navigator,const_248,const_223,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_663));
         this.setSelectedTab(const_340);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_323;
      }
      
      public function get tabs() : Array
      {
         return this.var_366;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_366)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_366)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_366)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
