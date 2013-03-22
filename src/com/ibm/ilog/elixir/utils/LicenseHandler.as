package com.ibm.ilog.elixir.utils 
{ 
    import flash.display.*; 
    import flash.events.*; 
    import flash.filters.*; 
    import flash.geom.*; 
    import flash.net.*; 
    import flash.system.*; 
    import flash.text.*; 
    import flash.ui.*; 
    import mx.core.*; 
    import mx.resources.*; 

    public class LicenseHandler extends Object 
    { 
        private var _p:DisplayObjectContainer; 
        private var _textField:TextField; 
        private var _foreground:Sprite; 
        private var _time:Number; 
        private var _darkBackground:Boolean = false; 
        private static const wmarkAfter:Number = 0; 
        private static const dBuild:Number = 1.28173e+012; 
        private static const wText:String = "Trial Version"; 
        private static const MENU_CAPTIONS:Array = [ResourceManager.getInstance().getString("ilogsparkutilities", "about.elixir"), ResourceManager.getInstance().getString("ilogsparkutilities", "about.elixirenterprise")]; 
        private static const DAY:Number = 86400000; 
        private static const TRIAL_PERIOD_DAYS:Number = 5.3568e+009; 

        public function LicenseHandler(p:DisplayObjectContainer, darkBackground:Boolean, time:Number) 
        { 
            this._p = p; 
            this._time = time; 
            this._darkBackground = darkBackground; 
            this._p.addEventListener("enterFrame", this.enterFrameHandler); 
            return; 
        }// end function 

        protected function checkVisible(p:DisplayObjectContainer) : Boolean 
        { 
            return true; 
        }// end function 

        private function enterFrameHandler(event:Event) : void 
        { 
            var _loc_2:Graphics = null; 
            var _loc_3:UIComponent = null; 
            var _loc_4:TextFormat = null; 
            var _loc_5:String = null; 
            var _loc_6:Array = null; 
            var _loc_7:UIComponent = null; 
            if (this._textField != null) 
            { 
            } 
            if (!this.checkVisible(this._p)) 
            { 
                this._textField.visible = false; 
                return; 
            } 
            var _loc_8:* = new Point(); 
            var _loc_9:* = new Point(this._p.width, this._p.height); 
            _loc_8 = this._p.localToGlobal(_loc_8); 
            _loc_9 = this._p.localToGlobal(_loc_9); 
            var _loc_10:* = Math.abs(_loc_9.x - _loc_8.x); 
            var _loc_11:* = Math.abs(_loc_9.y - _loc_8.y); 
//            if (this._time > dBuild + TRIAL_PERIOD_DAYS) 
//            { 
//                if (!this._foreground) 
//                { 
//                    this._foreground = new Sprite(); 
//                    this._foreground.mouseEnabled = false; 
//                } 
//                if (!this._foreground.parent) 
//                { 
//                    if (this._p is Container) 
//                    { 
//                        _loc_3 = new UIComponent(); 
//                        this._p.addChild(_loc_3); 
//                        _loc_3.addChild(this._foreground); 
//                    } 
//                    else 
//                    { 
//                        this._p.addChild(this._foreground); 
//                    } 
//                } 
//                this._foreground.width = this._p.width; 
//                this._foreground.height = this._p.height; 
//                _loc_2 = this._foreground.graphics; 
//                _loc_2.clear(); 
//                _loc_2.beginFill(1118481, (this._time - dBuild - TRIAL_PERIOD_DAYS) / (1 * DAY)); 
//                _loc_2.drawRect(0, 0, this._p.width, this._p.height); 
//                _loc_2.endFill(); 
//            } 
            if (_loc_10 < 20) 
            { 
            } 
            if (_loc_11 >= 20) 
            { 
            } 
            if (!this._p.visible) 
            { 
                if (this._textField != null) 
                { 
                    this._textField.visible = false; 
                } 
                return; 
            } 
            if (!this._textField) 
            { 
                this._textField = new TextField(); 
                this._textField.selectable = false; 
                this._textField.autoSize = TextFieldAutoSize.CENTER; 
                this._textField.textColor = 16777215; 
                this._textField.backgroundColor = 0; 
                _loc_4 = new TextFormat(); 
                _loc_4.font = "Verdana"; 
                _loc_4.size = 32; 
                _loc_4.bold = true; 
                this._textField.defaultTextFormat = _loc_4; 
                _loc_5 = wText; 
                if (_loc_5 != null) 
                { 
                } 
                if (_loc_5.length < 1) 
                { 
                    _loc_5 = "IBM ILOG Elixir Trial"; 
                } 
                if (this._time < dBuild + TRIAL_PERIOD_DAYS) 
                { 
                    //_loc_5 = _loc_5 + (" " + Math.round((dBuild + TRIAL_PERIOD_DAYS - this._time) / DAY) + " Days Left过期吗"); 
                    _loc_5 = "无期限"; 
                } 
                else 
                { 
                    _loc_5 = _loc_5 + " Ended"; 
                } 
                this._textField.text = _loc_5; 
                this._textField.alpha = 0.35; 
                this._textField.mouseEnabled = false; 
                _loc_6 = []; 
                _loc_6.push(new GlowFilter(this._darkBackground ? (16777215) : (0), 1, 6, 6, 2, 1, false, true)); 
                this._textField.filters = _loc_6; 
                this._textField.x = Math.round(-10 * Math.random()); 
                this._textField.y = Math.round(-40 * Math.random()); 
            } 
            if (!this._textField.parent) 
            { 
                if (this._p is Container) 
                { 
                    _loc_7 = new UIComponent(); 
                    this._p.addChild(_loc_7); 
                    _loc_7.addChild(this._textField); 
                } 
                else 
                { 
                    this._p.addChild(this._textField); 
                } 
            } 
            if (!this._textField.visible) 
            { 
                this._textField.visible = true; 
            } 
            this._textField.x = this._p.width / 2 - this._textField.width / 2; 
            this._textField.y = this._p.height / 2 - this._textField.height / 2; 
            this._textField.visible = false; 
            return; 
        }// end function 

        public static function displayWatermark(where:DisplayObjectContainer, darkBackground:Boolean = false) : void 
        { 
            new LicenseHandler(where, darkBackground, new Date().getTime()); 
            return; 
        }// end function 

        public static function addElixirToMenu() : void 
        { 
            addToMenu(MENU_CAPTIONS[0], "http://www-01.ibm.com/software/integration/visualization/elixir/"); 
            return; 
        }// end function 

        public static function addElixirEnterpriseToMenu() : void 
        { 
            addToMenu(MENU_CAPTIONS[1], "http://www-01.ibm.com/software/integration/visualization/elixir-enterprise/"); 
            return; 
        }// end function 

        private static function addToMenu(menuText:String, url:String) : void 
        { 
            var item:ContextMenuItem; 
            var menuText:* = menuText; 
            var url:* = url; 
            menuText = menuText; 
            url = url; 
            if (Security.sandboxType == Security.LOCAL_WITH_FILE) 
            { 
                return; 
            } 
            var menu:* = FlexGlobals.topLevelApplication.contextMenu; 
            if (menu == null) 
            { 
                menu = new ContextMenu(); 
                FlexGlobals.topLevelApplication.contextMenu = menu; 
            } 
            var _loc_4:int; 
            var _loc_5:* = menu.customItems; 
            while (_loc_5 in _loc_4) 
            { 
                 
                item = _loc_5[_loc_4]; 
                if (item.caption != MENU_CAPTIONS[0]) 
                { 
                } 
                if (item.caption == MENU_CAPTIONS[1]) 
                { 
                    return; 
                } 
            } 
            item = new ContextMenuItem(menuText, true); 
            item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, function (event:ContextMenuEvent) : void 
            { 
                navigateToURL(new URLRequest(url)); 
                return; 
            }// end function 
            ); 
            menu.customItems.push(item); 
            menu.customItems = menu.customItems; 
            return; 
        }// end function 

    } 
}