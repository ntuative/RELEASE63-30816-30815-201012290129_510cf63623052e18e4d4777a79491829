package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class SSOTicket extends EventDispatcher
   {
      
      public static const const_382:String = "success";
      
      public static const const_260:String = "failure";
       
      
      private var var_35:URLLoader;
      
      private var var_1254:String;
      
      private var var_1253:IHabboWebLogin;
      
      private var var_2708:String;
      
      private var var_1544:String;
      
      private var var_2119:String;
      
      private var _assets:IAssetLibrary;
      
      private var var_2118:Boolean;
      
      public function SSOTicket(param1:IAssetLibrary, param2:IHabboWebLogin, param3:String, param4:Boolean = true)
      {
         super();
         this._assets = param1;
         this.var_1253 = param2;
         this.var_1254 = "http://" + param3 + "/client";
         if(!param4)
         {
            this.var_1253.init();
            this.var_1253.addEventListener(HabboWeb.const_211,this.requestClientURL);
         }
         else
         {
            this.requestClientURL();
         }
      }
      
      public function get ticket() : String
      {
         return this.var_1544;
      }
      
      public function get isFacebookUser() : Boolean
      {
         return this.var_2118;
      }
      
      public function get shockwaveClientUrl() : String
      {
         return this.var_2119;
      }
      
      private function requestClientURL(param1:Event = null) : void
      {
         var _loc2_:String = this.var_1254;
         if(this._assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + this.var_1254);
         }
         var _loc3_:URLRequest = new URLRequest(this.var_1254);
         if(this._assets.hasAsset(_loc2_))
         {
            this._assets.removeAsset(this._assets.getAssetByName(_loc2_));
         }
         var _loc4_:AssetLoaderStruct = this._assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_30,this.clientURLComplete);
      }
      
      private function clientURLComplete(param1:Event = null) : void
      {
         var facebookData:Object = null;
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         var data:String = loaderStruct.assetLoader.content as String;
         if(data.indexOf("account/reauthenticate\"") > -1)
         {
            this.var_1253.requestReAuthenticate();
         }
         else
         {
            try
            {
               this.var_1544 = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
               this.var_2119 = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
               facebookData = /\"facebook.user\" : \"(.*?)\"/.exec(data);
               if(facebookData)
               {
                  this.var_2118 = Boolean(facebookData[1]);
               }
               if(this.var_1544.length > 0)
               {
                  dispatchEvent(new Event(const_382));
               }
               else
               {
                  dispatchEvent(new Event(const_260));
               }
            }
            catch(e:Error)
            {
               dispatchEvent(new Event(const_260));
            }
         }
      }
   }
}
