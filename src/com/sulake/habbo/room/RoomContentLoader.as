package com.sulake.habbo.room
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectLogicEnum;
   import com.sulake.habbo.room.object.RoomObjectVisualizationEnum;
   import com.sulake.habbo.room.utils.PublicRoomData;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.room.IRoomContentLoader;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   
   public class RoomContentLoader implements IRoomContentLoader, IFurniDataListener, IDisposable
   {
      
      public static const const_767:String = "RCL_LOADER_READY";
      
      private static const const_311:String = "RCL_PUBLICROOM_";
      
      private static const const_1579:int = 0;
      
      private static const const_869:int = 1;
      
      private static const name_2:int = 2;
      
      private static const const_393:String = "place_holder";
      
      private static const const_558:String = "wall_place_holder";
      
      private static const const_1222:String = const_393;
      
      private static const ROOM_CONTENT:String = "room";
      
      private static const const_868:String = "tile_cursor";
      
      private static const const_867:String = "selection_arrow";
       
      
      private var var_479:Map = null;
      
      private var _events:Map = null;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_722:Map = null;
      
      private var var_392:Map = null;
      
      private var var_443:IRoomObjectVisualizationFactory = null;
      
      private var _state:int = 0;
      
      private var var_1356:IEventDispatcher = null;
      
      private var var_641:Boolean = false;
      
      private var var_2402:Boolean = false;
      
      private var var_581:Map = null;
      
      private var var_584:Array;
      
      private var var_582:Map = null;
      
      private var _wallItems:Array;
      
      private var var_183:PublicRoomData = null;
      
      private var var_1355:Map = null;
      
      private var var_583:Map = null;
      
      private var var_478:Map = null;
      
      private var var_480:Map = null;
      
      private var var_721:Map = null;
      
      private var var_2396:String;
      
      private var var_2398:String;
      
      private var var_2401:String;
      
      private var var_2397:String;
      
      private var var_2400:Array;
      
      private var var_2399:Array;
      
      private var var_1727:Boolean = false;
      
      private var var_387:ISessionDataManager;
      
      public function RoomContentLoader()
      {
         this.var_584 = [];
         this._wallItems = [];
         this.var_2400 = ["hh_people_pool","hh_people_pool_calippo","hh_paalu","hh_people_paalu"];
         this.var_2399 = ["room_public","room_public_park","room_public_pool"];
         super();
         this.var_479 = new Map();
         this._events = new Map();
         this._assetLibrary = new AssetLibrary("room_engine");
         this.var_581 = new Map();
         this.var_582 = new Map();
         this.var_721 = new Map();
         this.var_583 = new Map();
         this.var_478 = new Map();
         this.var_480 = new Map();
         this.var_392 = new Map();
         this.var_722 = new Map();
         this.var_1355 = new Map();
      }
      
      public function set sessionDataManager(param1:ISessionDataManager) : void
      {
         this.var_387 = param1;
         if(this.var_1727)
         {
            this.var_1727 = false;
            this.initFurniData();
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_641;
      }
      
      public function set visualizationFactory(param1:IRoomObjectVisualizationFactory) : void
      {
         this.var_443 = param1;
      }
      
      public function initialize(param1:IEventDispatcher, param2:IHabboConfigurationManager) : void
      {
         if(this._state >= const_869)
         {
            return;
         }
         this.var_1356 = param1;
         this.var_2396 = param2.getKey("flash.dynamic.download.url","furniture/");
         this.var_2398 = param2.getKey("flash.dynamic.download.name.template","%typeid%.swf");
         this.var_2401 = param2.getKey("public.room.dynamic.download.url","");
         this.var_2397 = param2.getKey("public.room.dynamic.download.name.template","%typeid%.swf");
         this._state = const_869;
         this.initFurniData();
      }
      
      private function initFurniData() : void
      {
         if(this.var_387 == null)
         {
            this.var_1727 = true;
            return;
         }
         var _loc1_:Array = this.var_387.getFurniData(this);
         if(_loc1_ == null)
         {
            return;
         }
         this.populateFurniData(_loc1_);
         this.var_2402 = true;
         this.continueInitilization();
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_479 != null)
         {
            _loc1_ = this.var_479.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.var_479.getWithIndex(_loc2_) as AssetLibrary;
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_479.dispose();
            this.var_479 = null;
         }
         if(this._events != null)
         {
            this._events.dispose();
            this._events = null;
         }
         if(this.var_581 != null)
         {
            this.var_581.dispose();
            this.var_581 = null;
         }
         if(this.var_582 != null)
         {
            this.var_582.dispose();
            this.var_582 = null;
         }
         if(this._assetLibrary != null)
         {
            this._assetLibrary.dispose();
            this._assetLibrary = null;
         }
         if(this.var_583 != null)
         {
            this.var_583.dispose();
            this.var_583 = null;
         }
         if(this.var_478 != null)
         {
            this.var_478.dispose();
            this.var_478 = null;
         }
         if(this.var_480 != null)
         {
            this.var_480.dispose();
            this.var_480 = null;
         }
         if(this.var_721 != null)
         {
            this.var_721.dispose();
            this.var_721 = null;
         }
         if(this.var_392 != null)
         {
            _loc1_ = this.var_392.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc4_ = this.var_392.getWithIndex(_loc2_) as IGraphicAssetCollection;
               if(_loc4_ != null)
               {
                  _loc4_.dispose();
               }
               _loc2_++;
            }
            this.var_392.dispose();
            this.var_392 = null;
         }
         if(this.var_722 != null)
         {
            this.var_722.dispose();
            this.var_722 = null;
         }
         this.var_584 = [];
         this._wallItems = [];
         this.var_1356 = null;
         this.var_387 = null;
         this.var_641 = true;
      }
      
      private function populateFurniData(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_.id;
            _loc4_ = _loc2_.name;
            if(_loc2_.colourIndex > 0)
            {
               _loc4_ = _loc4_ + "*" + _loc2_.colourIndex;
            }
            _loc5_ = _loc2_.revision;
            _loc6_ = _loc2_.adUrl;
            if(_loc6_.length > 0)
            {
               this.var_721.add(_loc4_,_loc6_);
            }
            _loc7_ = _loc2_.name;
            if(_loc2_.type == "s")
            {
               this.var_581.add(_loc3_,_loc4_);
               if(this.var_584.indexOf(_loc7_) < 0)
               {
                  this.var_584.push(_loc7_);
               }
            }
            else if(_loc2_.type == "i")
            {
               if(_loc4_ == "post.it")
               {
                  _loc4_ = "post_it";
                  _loc7_ = "post_it";
               }
               if(_loc4_ == "post.it.vd")
               {
                  _loc4_ = "post_it_vd";
                  _loc7_ = "post_it_vd";
               }
               this.var_582.add(_loc3_,_loc4_);
               if(this._wallItems.indexOf(_loc7_) < 0)
               {
                  this._wallItems.push(_loc7_);
               }
            }
            _loc8_ = this.var_583.getValue(_loc7_);
            if(_loc5_ > _loc8_)
            {
               this.var_583.remove(_loc7_);
               this.var_583.add(_loc7_,_loc5_);
            }
         }
      }
      
      private function continueInitilization() : void
      {
         if(this.var_2402)
         {
            this._state = name_2;
            if(this.var_1356 != null)
            {
               this.var_1356.dispatchEvent(new Event(const_767));
            }
         }
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(this.var_478 != null)
         {
            this.var_478.remove(param1);
            this.var_478.add(param1,param2);
         }
         if(this.var_480 != null)
         {
            this.var_480.remove(param2);
            this.var_480.add(param2,param1);
         }
      }
      
      private function getRoomObjectAlias(param1:String) : String
      {
         var _loc2_:* = null;
         if(this.var_478 != null)
         {
            _loc2_ = this.var_478.getValue(param1) as String;
         }
         if(_loc2_ == null)
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private function getRoomObjectOriginalName(param1:String) : String
      {
         var _loc2_:* = null;
         if(this.var_480 != null)
         {
            _loc2_ = this.var_480.getValue(param1) as String;
         }
         if(_loc2_ == null)
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public function getObjectCategory(param1:String) : int
      {
         if(param1 == null)
         {
            return RoomObjectCategoryEnum.const_148;
         }
         if(this.var_584.indexOf(param1) >= 0)
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE;
         }
         if(this._wallItems.indexOf(param1) >= 0)
         {
            return RoomObjectCategoryEnum.const_27;
         }
         if(param1.indexOf("poster") == 0)
         {
            return RoomObjectCategoryEnum.const_27;
         }
         if(this.var_183 != null && (this.var_183.type == param1 || this.var_183.hasWorldType(param1)))
         {
            return RoomObjectCategoryEnum.const_71;
         }
         if(param1 == "room")
         {
            return RoomObjectCategoryEnum.const_71;
         }
         if(param1 == "user")
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1 == "pet")
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1 == "bot")
         {
            return RoomObjectCategoryEnum.OBJECT_CATEGORY_USER;
         }
         if(param1 == "tile_cursor" || param1 == "selection_arrow")
         {
            return RoomObjectCategoryEnum.const_302;
         }
         return RoomObjectCategoryEnum.const_148;
      }
      
      public function getPlaceHolderType(param1:String) : String
      {
         if(this.var_584.indexOf(param1) >= 0)
         {
            return const_393;
         }
         if(this._wallItems.indexOf(param1) >= 0)
         {
            return const_558;
         }
         if(this.var_183 != null && (this.var_183.type == param1 || this.var_183.hasWorldType(param1)))
         {
            return ROOM_CONTENT;
         }
         return const_1222;
      }
      
      public function getPlaceHolderTypes() : Array
      {
         return [const_393,const_558,ROOM_CONTENT,const_868,const_867];
      }
      
      public function getActiveObjectType(param1:int) : String
      {
         var _loc2_:String = this.var_581.getValue(param1) as String;
         return this.getObjectType(_loc2_);
      }
      
      public function getWallItemType(param1:int, param2:String = null) : String
      {
         var _loc3_:String = this.var_582.getValue(param1) as String;
         if(_loc3_ == "poster" && param2 != null)
         {
            _loc3_ += param2;
         }
         return this.getObjectType(_loc3_);
      }
      
      public function getActiveObjectColorIndex(param1:int) : int
      {
         var _loc2_:String = this.var_581.getValue(param1) as String;
         return this.getObjectColorIndex(_loc2_);
      }
      
      public function getWallItemColorIndex(param1:int) : int
      {
         var _loc2_:String = this.var_582.getValue(param1) as String;
         return this.getObjectColorIndex(_loc2_);
      }
      
      public function getRoomObjectAdURL(param1:String) : String
      {
         if(this.var_721.getValue(param1) != null)
         {
            return this.var_721.getValue(param1);
         }
         return "";
      }
      
      private function getObjectType(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = param1.indexOf("*");
         if(_loc2_ >= 0)
         {
            param1 = param1.substr(0,_loc2_);
         }
         return param1;
      }
      
      private function getObjectColorIndex(param1:String) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         var _loc2_:int = 0;
         var _loc3_:int = param1.indexOf("*");
         if(_loc3_ >= 0)
         {
            _loc2_ = int(param1.substr(_loc3_ + 1));
         }
         return _loc2_;
      }
      
      public function getContentType(param1:String) : String
      {
         if(param1.indexOf("@shadow") > -1)
         {
            if(param1.indexOf("@shadow") == param1.length - 7)
            {
               param1 = param1.substr(0,param1.length - 7);
            }
         }
         return param1;
      }
      
      public function getPublicRoomContentType(param1:String) : String
      {
         if(this.var_183 != null && this.var_183.hasWorldType(const_311 + param1))
         {
            return this.var_183.type;
         }
         return param1;
      }
      
      public function hasInternalContent(param1:String) : Boolean
      {
         if(param1 == RoomObjectVisualizationEnum.const_167 || param1 == RoomObjectVisualizationEnum.const_64 || param1 == RoomObjectVisualizationEnum.BOT)
         {
            return true;
         }
         return false;
      }
      
      private function getObjectRevision(param1:String) : int
      {
         var _loc3_:int = 0;
         var _loc2_:int = this.getObjectCategory(param1);
         if(_loc2_ == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE || _loc2_ == RoomObjectCategoryEnum.const_27)
         {
            if(param1.indexOf("poster") == 0)
            {
               param1 = "poster";
            }
            return int(this.var_583.getValue(param1));
         }
         return 0;
      }
      
      private function getObjectContentURLs(param1:String) : Array
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         _loc2_ = this.getContentType(param1);
         Logger.log("Getting content URL for object type: " + param1);
         switch(_loc2_)
         {
            case const_393:
               return ["PlaceHolderFurniture.swf"];
            case const_558:
               return ["PlaceHolderWallItem.swf"];
            case ROOM_CONTENT:
               return ["HabboRoomContent.swf"];
            case const_868:
               return ["TileCursor.swf"];
            case const_867:
               return ["SelectionArrow.swf"];
            default:
               _loc3_ = this.getObjectCategory(_loc2_);
               if(_loc3_ == RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE || _loc3_ == RoomObjectCategoryEnum.const_27)
               {
                  _loc4_ = this.getRoomObjectAlias(_loc2_);
                  _loc5_ = this.var_2398;
                  _loc5_ = _loc5_.replace(/%typeid%/,_loc4_);
                  _loc6_ = this.getObjectRevision(_loc2_);
                  _loc5_ = _loc5_.replace(/%revision%/,_loc6_);
                  return [this.var_2396 + _loc5_];
               }
               _loc7_ = _loc2_.split(",");
               _loc8_ = [];
               _loc9_ = 0;
               while(_loc9_ < _loc7_.length)
               {
                  _loc10_ = this.var_2397;
                  _loc10_ = _loc10_.replace(/%typeid%/,_loc7_[_loc9_]);
                  _loc8_.push(this.var_2401 + _loc10_);
                  _loc9_++;
               }
               return _loc8_;
         }
      }
      
      public function insertObjectContent(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:String = this.getAssetLibraryType(param3);
         switch(param2)
         {
            case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
               this.var_581[param1] = _loc4_;
               break;
            case RoomObjectCategoryEnum.const_27:
               this.var_582[param1] = _loc4_;
               break;
            default:
               throw new Error("Registering content library for unsupported category " + param2 + "!");
         }
         var _loc5_:AssetLibraryCollection = this.addAssetLibraryCollection(_loc4_,null) as AssetLibraryCollection;
         if(_loc5_)
         {
            _loc5_.addAssetLibrary(param3);
            if(this.initializeGraphicAssetCollection(_loc4_,param3))
            {
               switch(param2)
               {
                  case RoomObjectCategoryEnum.OBJECT_CATEGORY_FURNITURE:
                     if(this.var_584.indexOf(_loc4_) == -1)
                     {
                        this.var_584.push(_loc4_);
                     }
                     break;
                  case RoomObjectCategoryEnum.const_27:
                     if(this._wallItems.indexOf(_loc4_) == -1)
                     {
                        this._wallItems.push(_loc4_);
                     }
                     break;
                  default:
                     throw new Error("Registering content library for unsupported category " + param2 + "!");
               }
               _loc6_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_348,_loc4_);
               _loc7_ = this.getAssetLibraryEventDispatcher(_loc4_,true);
               if(_loc7_)
               {
                  _loc7_.dispatchEvent(_loc6_);
               }
               return true;
            }
         }
         return false;
      }
      
      public function loadObjectContent(param1:String, param2:IEventDispatcher) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc3_:* = null;
         if(param1.indexOf(",") >= 0)
         {
            _loc3_ = param1;
            param1 = _loc3_.split(",")[0];
         }
         if(this.var_1355.getValue(param1) != null)
         {
            this.var_183 = this.var_1355.getValue(param1) as PublicRoomData;
         }
         if(this.getAssetLibrary(param1) != null || this.getAssetLibraryEventDispatcher(param1) != null)
         {
            return false;
         }
         var _loc4_:AssetLibraryCollection = this.addAssetLibraryCollection(param1,param2) as AssetLibraryCollection;
         if(_loc4_ == null)
         {
            return false;
         }
         if(_loc3_ != null)
         {
            _loc5_ = this.getObjectContentURLs(_loc3_);
         }
         else
         {
            _loc5_ = this.getObjectContentURLs(param1);
         }
         if(_loc5_ != null && _loc5_.length > 0)
         {
            _loc4_.addEventListener(AssetLibrary.const_749,this.onContentLoaded);
            _loc6_ = 0;
            while(_loc6_ < _loc5_.length)
            {
               _loc7_ = new LibraryLoader();
               _loc7_.load(new URLRequest(_loc5_[_loc6_]));
               _loc4_.loadFromFile(_loc7_,true);
               _loc7_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.onContentLoadError);
               _loc6_++;
            }
            return true;
         }
         return false;
      }
      
      public function loadLegacyContent(param1:String, param2:IEventDispatcher) : Array
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:Array = param1.split(",");
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_].toString().length > 0 && this.var_2400.indexOf(_loc3_[_loc5_]) == -1)
            {
               _loc6_ = _loc3_[_loc5_].toString();
               while(_loc6_.indexOf(" ") >= 0)
               {
                  if(_loc6_.indexOf(" ") == 0)
                  {
                     _loc6_ = _loc6_.substr(1,_loc6_.length - 1);
                  }
                  else if(_loc6_.indexOf(" ") == _loc6_.length - 1)
                  {
                     _loc6_ = _loc6_.substr(0,_loc6_.length - 2);
                  }
               }
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            _loc7_ = _loc4_[0];
            _loc5_ = 1;
            while(_loc5_ < _loc4_.length)
            {
               _loc7_ += ",";
               _loc7_ += _loc4_[_loc5_];
               _loc5_++;
            }
            if(this.loadObjectContent(_loc7_,param2))
            {
               return [_loc4_[0]];
            }
         }
         return [];
      }
      
      private function onContentLoadError(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         var _loc3_:Array = this.getPlaceHolderTypes();
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = this.getObjectContentURLs(_loc4_);
            if(_loc5_.length > 0 && _loc5_[0] == _loc2_.url)
            {
               Core.crash("Failed to load asset: " + _loc2_.url,Core.const_1329);
               return;
            }
         }
      }
      
      private function onContentLoaded(param1:Event) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this.disposed)
         {
            return;
         }
         var _loc2_:IAssetLibrary = param1.target as IAssetLibrary;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:String = this.getAssetLibraryType(_loc2_);
         _loc5_ = this.getRoomObjectOriginalName(_loc5_);
         if(_loc5_ != null)
         {
            _loc4_ = this.initializeGraphicAssetCollection(_loc5_,_loc2_);
         }
         if(_loc4_)
         {
            if(this.var_2399.indexOf(this.getVisualizationType(_loc5_)) >= 0)
            {
               _loc7_ = this.getVisualizationXML(_loc5_);
               _loc8_ = this.extractPublicRoomFromXML(_loc5_,_loc7_);
               this.var_1355.add(_loc5_,_loc8_);
               this.var_183 = _loc8_;
               this.extractPublicRoomFurnitures(_loc5_,_loc2_);
            }
            _loc3_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_348,_loc5_);
         }
         else
         {
            _loc3_ = new RoomContentLoadedEvent(RoomContentLoadedEvent.const_412,_loc5_);
         }
         var _loc6_:IEventDispatcher = this.getAssetLibraryEventDispatcher(_loc5_,true);
         if(_loc6_ != null && _loc3_ != null)
         {
            _loc6_.dispatchEvent(_loc3_);
         }
      }
      
      private function extractPublicRoomFurnitures(param1:String, param2:IAssetLibrary) : int
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 == null)
         {
            return 0;
         }
         var _loc3_:Array = param2.nameArray;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_];
            if(_loc6_.indexOf("_index") > 0)
            {
               _loc7_ = _loc6_.slice(0,_loc6_.indexOf("_index"));
               if(this.extractObjectContent(param1,_loc7_))
               {
                  _loc4_++;
               }
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function initializeGraphicAssetCollection(param1:String, param2:IAssetLibrary) : Boolean
      {
         var _loc5_:* = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         var _loc4_:IGraphicAssetCollection = this.createGraphicAssetCollection(param1,param2);
         if(_loc4_ != null)
         {
            _loc5_ = this.getAssetXML(param1);
            if(_loc4_.define(_loc5_))
            {
               _loc3_ = true;
            }
            else
            {
               this.disposeGraphicAssetCollection(param1);
            }
         }
         return _loc3_;
      }
      
      public function extractObjectContent(param1:String, param2:String) : Boolean
      {
         var _loc3_:IAssetLibrary = this.getAssetLibrary(param1);
         this.var_722.add(param2,param1);
         if(this.initializeGraphicAssetCollection(param2,_loc3_))
         {
            return true;
         }
         this.var_722.remove(param2);
         return false;
      }
      
      private function getAssetLibraryName(param1:String) : String
      {
         return "RoomContentLoader " + param1;
      }
      
      private function getAssetLibrary(param1:String) : IAssetLibrary
      {
         var _loc4_:* = null;
         var _loc2_:String = this.getContentType(param1);
         _loc2_ = this.getRoomObjectOriginalName(_loc2_);
         var _loc3_:IAssetLibrary = this.var_479.getValue(this.getAssetLibraryName(_loc2_)) as IAssetLibrary;
         if(_loc3_ == null)
         {
            _loc4_ = this.var_722.getValue(_loc2_);
            if(_loc4_ != null)
            {
               _loc2_ = this.getContentType(_loc4_);
               _loc3_ = this.var_479.getValue(this.getAssetLibraryName(_loc2_)) as IAssetLibrary;
            }
         }
         return _loc3_;
      }
      
      private function addAssetLibraryCollection(param1:String, param2:IEventDispatcher) : IAssetLibrary
      {
         var _loc3_:String = this.getContentType(param1);
         var _loc4_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         var _loc5_:String = this.getAssetLibraryName(_loc3_);
         _loc4_ = new AssetLibraryCollection(_loc5_);
         this.var_479.add(_loc5_,_loc4_);
         if(param2 != null && this.getAssetLibraryEventDispatcher(param1) == null)
         {
            this._events.add(_loc3_,param2);
         }
         return _loc4_;
      }
      
      private function getAssetLibraryEventDispatcher(param1:String, param2:Boolean = false) : IEventDispatcher
      {
         var _loc3_:String = this.getContentType(param1);
         if(!param2)
         {
            return this._events.getValue(_loc3_);
         }
         return this._events.remove(_loc3_);
      }
      
      private function getAssetLibraryType(param1:IAssetLibrary) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAsset = param1.getAssetByName("index");
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.@type;
      }
      
      public function getVisualizationType(param1:String) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:IAsset = _loc2_.getAssetByName(param1 + "_index");
         if(_loc3_ == null)
         {
            _loc3_ = _loc2_.getAssetByName("index");
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_.content as XML;
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.@visualization;
      }
      
      public function getLogicType(param1:String) : String
      {
         var _loc6_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:IAsset = _loc2_.getAssetByName(param1 + "_index");
         if(_loc3_ == null)
         {
            _loc3_ = _loc2_.getAssetByName("index");
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_.content as XML;
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:String = _loc4_.@logic;
         if(_loc5_ != RoomObjectLogicEnum.const_256 && _loc5_ != RoomObjectLogicEnum.const_167)
         {
            _loc6_ = "@shadow";
            if(param1.indexOf(_loc6_) > -1)
            {
               if(param1.indexOf(_loc6_) == param1.length - _loc6_.length)
               {
                  _loc5_ = "null";
               }
            }
         }
         return _loc5_;
      }
      
      public function getVisualizationXML(param1:String) : XML
      {
         return this.getXML(param1,"_visualization");
      }
      
      public function getAssetXML(param1:String) : XML
      {
         return this.getXML(param1,"_assets");
      }
      
      public function getLogicXML(param1:String) : XML
      {
         return this.getXML(param1,"_logic");
      }
      
      private function getXML(param1:String, param2:String) : XML
      {
         var _loc3_:IAssetLibrary = this.getAssetLibrary(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:String = this.getContentType(param1);
         var _loc5_:String = this.getRoomObjectAlias(_loc4_);
         var _loc6_:IAsset = _loc3_.getAssetByName(_loc5_ + param2);
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:XML = _loc6_.content as XML;
         if(_loc7_ == null)
         {
            return null;
         }
         return _loc7_;
      }
      
      public function addGraphicAsset(param1:String, param2:String, param3:BitmapData, param4:Boolean) : Boolean
      {
         var _loc5_:IGraphicAssetCollection = this.getGraphicAssetCollection(param1);
         if(_loc5_ != null)
         {
            return _loc5_.addAsset(param2,param3,param4);
         }
         return false;
      }
      
      private function createGraphicAssetCollection(param1:String, param2:IAssetLibrary) : IGraphicAssetCollection
      {
         var _loc3_:IGraphicAssetCollection = this.getGraphicAssetCollection(param1);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         if(param2 == null)
         {
            return null;
         }
         _loc3_ = this.var_443.createGraphicAssetCollection();
         if(_loc3_ != null)
         {
            _loc3_.assetLibrary = param2;
            this.var_392.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      public function getGraphicAssetCollection(param1:String) : IGraphicAssetCollection
      {
         var _loc2_:String = this.getContentType(param1);
         return this.var_392.getValue(_loc2_) as IGraphicAssetCollection;
      }
      
      private function disposeGraphicAssetCollection(param1:String) : Boolean
      {
         var _loc3_:* = null;
         var _loc2_:String = this.getContentType(param1);
         if(this.var_392[_loc2_] != null)
         {
            _loc3_ = this.var_392.remove(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.dispose();
            }
            return true;
         }
         return false;
      }
      
      private function extractPublicRoomFromXML(param1:String, param2:XML) : PublicRoomData
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = NaN;
         var _loc9_:* = NaN;
         var _loc3_:XMLList = param2.layoutData;
         var _loc4_:PublicRoomData = new PublicRoomData(param1);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length())
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = const_311 + String(_loc6_.@name);
            _loc8_ = 32;
            _loc9_ = 1;
            if(String(_loc6_.@size) != "")
            {
               _loc8_ = Number(parseInt(_loc6_.@size));
            }
            if(String(_loc6_.@heightScale) != "")
            {
               _loc9_ = Number(parseFloat(_loc6_.@heightScale));
            }
            _loc4_.addWorld(_loc7_,_loc8_,_loc9_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(this.getObjectCategory(const_311 + param1) == RoomObjectCategoryEnum.const_71)
         {
            return true;
         }
         return false;
      }
      
      public function getPublicRoomWorldHeightScale(param1:String) : Number
      {
         if(this.var_183 != null)
         {
            return this.var_183.getWorldHeightScale(const_311 + param1);
         }
         return 1;
      }
      
      public function getPublicRoomWorldSize(param1:String) : int
      {
         if(this.var_183 != null)
         {
            return this.var_183.getWorldScale(const_311 + param1);
         }
         return 32;
      }
      
      public function furniDataReady() : void
      {
         this.initFurniData();
      }
   }
}
