package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SpacesCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_191:String = "floor";
      
      private static const const_190:String = "wallpaper";
      
      private static const const_90:String = "landscape";
       
      
      private var _configuration:XML;
      
      private var var_1275:Array;
      
      private var var_837:Array;
      
      private var var_371:int = 0;
      
      private var var_374:int = 0;
      
      private var var_838:int = 0;
      
      private var var_1575:String = "default";
      
      private var var_1273:Array;
      
      private var _activeFloorPatterns:Array;
      
      private var var_373:int = 0;
      
      private var var_456:int = 0;
      
      private var var_840:int = 0;
      
      private var _floorType:String = "default";
      
      private var var_1274:Array;
      
      private var var_839:Array;
      
      private var var_372:int = 0;
      
      private var var_457:int = 0;
      
      private var var_836:int = 0;
      
      private var var_1578:String = "1.1";
      
      private var var_1577:int = -1;
      
      private var var_1576:int = -1;
      
      private var var_312:BitmapData = null;
      
      private var var_313:BitmapData = null;
      
      public function SpacesCatalogWidget(param1:IWindowContainer)
      {
         this.var_1275 = [];
         this.var_837 = [];
         this.var_1273 = [];
         this._activeFloorPatterns = [];
         this.var_1274 = [];
         this.var_839 = [];
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(this.var_312 != null)
         {
            this.var_312.dispose();
            this.var_312 = null;
         }
         if(this.var_313 != null)
         {
            this.var_313.dispose();
            this.var_313 = null;
         }
         super.dispose();
      }
      
      override public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.init();
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(_loc1_ != null)
         {
            this._configuration = _loc1_.content as XML;
            for each(_loc2_ in page.offers)
            {
               _loc4_ = _loc2_.productContainer.firstProduct;
               _loc5_ = _loc2_.localizationId;
               _loc6_ = _loc5_.split(" ")[0];
               _loc7_ = _loc5_.split(" ")[1];
               _loc8_ = false;
               switch(_loc4_.furnitureData.name)
               {
                  case "floor":
                     for each(_loc9_ in this._configuration.floors.pattern)
                     {
                        this._activeFloorPatterns.push(String(_loc9_.@id));
                        this.var_1273.push(_loc2_);
                     }
                     break;
                  case "wallpaper":
                     for each(_loc10_ in this._configuration.walls.pattern)
                     {
                        if(_loc10_.@id == _loc7_)
                        {
                           this.var_837.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        this.var_1275.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find wallpaper pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  case "landscape":
                     for each(_loc11_ in this._configuration.landscapes.pattern)
                     {
                        if(_loc11_.@id == _loc7_)
                        {
                           this.var_839.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        this.var_1274.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find landscape pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + _loc4_.furnitureData.name);
                     break;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _window.numChildren)
            {
               _loc12_ = _window.getChildAt(_loc3_);
               if(_loc12_ is IButtonWindow)
               {
                  _loc12_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
               }
               _loc3_++;
            }
            this.changePattern(const_190,0);
            this.changePattern(const_90,0);
            this.changePattern(const_191,0);
            this.updateConfiguration();
            this.retrieveSpacesPreview();
            return;
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         switch(_loc2_.name)
         {
            case "ctlg_wall_pattern_prev":
               this.changePattern(const_190,-1);
               break;
            case "ctlg_wall_pattern_next":
               this.changePattern(const_190,1);
               break;
            case "ctlg_wall_color_prev":
               this.changeColor(const_190,-1);
               break;
            case "ctlg_wall_color_next":
               this.changeColor(const_190,1);
               break;
            case "ctlg_buy_wall":
               _loc3_ = this.var_1275[this.var_371];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this.var_1575);
               }
               break;
            case "ctlg_floor_pattern_prev":
               this.changePattern(const_191,-1);
               break;
            case "ctlg_floor_pattern_next":
               this.changePattern(const_191,1);
               break;
            case "ctlg_floor_color_prev":
               this.changeColor(const_191,-1);
               break;
            case "ctlg_floor_color_next":
               this.changeColor(const_191,1);
               break;
            case "ctlg_buy_floor":
               _loc3_ = this.var_1273[this.var_373];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this._floorType);
               }
               break;
            case "ctlg_landscape_pattern_next":
               this.changePattern(const_90,-1);
               break;
            case "ctlg_landscape_pattern_prev":
               this.changePattern(const_90,1);
               break;
            case "ctlg_landscape_color_prev":
               this.changeColor(const_90,-1);
               break;
            case "ctlg_landscape_color_next":
               this.changeColor(const_90,1);
               break;
            case "ctlg_buy_landscape":
               _loc3_ = this.var_1274[this.var_372];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this.var_1578);
               }
               break;
            default:
               Logger.log("Spaces, unknown button: " + _loc2_.name);
         }
         this.updateConfiguration();
         this.retrieveSpacesPreview();
      }
      
      private function updateConfiguration() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc2_:String = this.var_837[this.var_371];
         for each(_loc1_ in this._configuration.walls.pattern)
         {
            if(_loc1_.@id == _loc2_)
            {
               if(this.var_374 >= 0)
               {
                  _loc9_ = _loc1_.children()[this.var_374];
                  if(_loc9_ != null)
                  {
                     this.var_1575 = _loc9_.@id;
                  }
               }
            }
         }
         _loc3_ = this.var_1275[this.var_371];
         _loc4_ = (page.viewer.catalog as HabboCatalog).localization;
         if(_loc3_ != null)
         {
            _loc10_ = _window.findChildByName("ctlg_wall_price") as ITextWindow;
            if(_loc10_ != null)
            {
               _loc10_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc3_.priceInCredits));
            }
         }
         var _loc5_:String = this._activeFloorPatterns[this.var_373];
         for each(_loc1_ in this._configuration.floors.pattern)
         {
            if(_loc1_.@id == _loc5_)
            {
               _loc11_ = _loc1_.children()[this.var_456];
               if(_loc11_ != null)
               {
                  this._floorType = _loc11_.@id;
               }
            }
         }
         _loc6_ = this.var_1273[this.var_373];
         if(_loc6_ != null)
         {
            _loc12_ = _window.findChildByName("ctlg_floor_price") as ITextWindow;
            if(_loc12_ != null)
            {
               _loc12_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc6_.priceInCredits));
            }
         }
         var _loc7_:String = this.var_839[this.var_372];
         for each(_loc1_ in this._configuration.landscapes.pattern)
         {
            if(_loc1_.@id == _loc7_)
            {
               _loc13_ = _loc1_.children()[this.var_457];
               if(_loc13_ != null)
               {
                  this.var_1578 = _loc13_.@id;
               }
            }
         }
         _loc8_ = this.var_1274[this.var_372];
         if(_loc8_ != null)
         {
            _loc14_ = _window.findChildByName("ctlg_landscape_price") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc8_.priceInCredits));
            }
         }
      }
      
      private function changePattern(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1)
         {
            case const_190:
               this.var_371 += param2;
               if(this.var_371 < 0)
               {
                  this.var_371 = this.var_837.length - 1;
               }
               if(this.var_371 == this.var_837.length)
               {
                  this.var_371 = 0;
               }
               this.var_374 = 0;
               this.var_838 = 0;
               _loc5_ = this.var_837[this.var_371];
               for each(_loc8_ in this._configuration.walls.pattern)
               {
                  if(_loc8_.@id == _loc5_)
                  {
                     this.var_838 = _loc8_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_wall_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_wall_color_next") as IButtonWindow;
               if(this.var_838 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_191:
               this.var_373 += param2;
               if(this.var_373 < 0)
               {
                  this.var_373 = this._activeFloorPatterns.length - 1;
               }
               if(this.var_373 >= this._activeFloorPatterns.length)
               {
                  this.var_373 = 0;
               }
               this.var_456 = 0;
               this.var_840 = 0;
               _loc6_ = this._activeFloorPatterns[this.var_373];
               for each(_loc9_ in this._configuration.floors.pattern)
               {
                  if(_loc9_.@id == _loc6_)
                  {
                     this.var_840 = _loc9_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_floor_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_floor_color_next") as IButtonWindow;
               if(this.var_840 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_90:
               this.var_372 += param2;
               if(this.var_372 < 0)
               {
                  this.var_372 = this.var_839.length - 1;
               }
               if(this.var_372 >= this.var_839.length)
               {
                  this.var_372 = 0;
               }
               this.var_457 = 0;
               this.var_836 = 0;
               _loc7_ = this.var_839[this.var_372];
               for each(_loc10_ in this._configuration.landscapes.pattern)
               {
                  if(_loc10_.@id == _loc7_)
                  {
                     this.var_836 = _loc10_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_landscape_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_landscape_color_next") as IButtonWindow;
               if(this.var_836 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
         }
      }
      
      private function changeColor(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case const_190:
               this.var_374 += param2;
               if(this.var_374 < 0)
               {
                  if(this.var_838 > 0)
                  {
                     this.var_374 = this.var_838 - 1;
                  }
                  else
                  {
                     this.var_374 = 0;
                  }
               }
               if(this.var_374 >= this.var_838)
               {
                  this.var_374 = 0;
               }
               break;
            case const_191:
               this.var_456 += param2;
               if(this.var_456 < 0)
               {
                  if(this.var_840 > 0)
                  {
                     this.var_456 = this.var_840 - 1;
                  }
                  else
                  {
                     this.var_456 = 0;
                  }
               }
               if(this.var_456 >= this.var_840)
               {
                  this.var_456 = 0;
               }
               break;
            case const_90:
               this.var_457 += param2;
               if(this.var_457 < 0)
               {
                  if(this.var_836 > 0)
                  {
                     this.var_457 = this.var_836 - 1;
                  }
                  else
                  {
                     this.var_457 = 0;
                  }
               }
               if(this.var_457 >= this.var_836)
               {
                  this.var_457 = 0;
               }
         }
      }
      
      private function retrieveSpacesPreview() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:ImageResult = page.viewer.roomEngine.getRoomImage(this._floorType,this.var_1575,this.var_1578,64,this,"window_romantic_wide");
         var _loc3_:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage("window_romantic_wide","",new Vector3d(180,0,0),64,this,"window_romantic_wide");
         if(_loc2_ != null && _loc3_ != null)
         {
            this.var_1577 = _loc2_.id;
            this.var_1576 = _loc3_.id;
            _loc4_ = _loc2_.data as BitmapData;
            _loc5_ = _loc3_.data as BitmapData;
            if(this.var_312 != null)
            {
               this.var_312.dispose();
            }
            if(this.var_313 != null)
            {
               this.var_313.dispose();
            }
            this.var_312 = _loc4_;
            this.var_313 = _loc5_;
            this.setRoomImage(_loc4_,_loc5_);
         }
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 != null && param2 != null && true)
         {
            _loc3_ = new Point(param1.width / 2 + 4 + 19,param1.height / 2 - param2.height / 2 - 24 + 10);
            _loc4_ = new BitmapData(param1.width,param1.height,param1.transparent);
            _loc4_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
            _loc4_.copyPixels(param2,param2.rect,_loc3_,null,null,true);
            _loc5_ = window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               if(_loc5_.bitmap == null)
               {
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
               }
               _loc5_.bitmap.fillRect(_loc5_.bitmap.rect,16777215);
               _loc6_ = (_loc5_.width - _loc4_.width) / 2;
               _loc7_ = (_loc5_.height - _loc4_.height) / 2;
               _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point(_loc6_,_loc7_),null,null,true);
               _loc5_.invalidate();
            }
            _loc4_.dispose();
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         switch(param1)
         {
            case this.var_1577:
               this.var_1577 = 0;
               if(this.var_312 != null)
               {
                  this.var_312.dispose();
               }
               this.var_312 = param2;
               break;
            case this.var_1576:
               this.var_1576 = 0;
               if(this.var_313 != null)
               {
                  this.var_313.dispose();
               }
               this.var_313 = param2;
         }
         if(this.var_312 != null && this.var_313 != null)
         {
            this.setRoomImage(this.var_312,this.var_313);
         }
      }
   }
}
