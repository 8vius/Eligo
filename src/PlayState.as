package
{
	import com.greensock.TweenLite;
	import com.greensock.TweenNano;
	import com.greensock.data.TweenLiteVars;
	
	import flash.events.MouseEvent;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.system.FlxDebugger;
	
	public class PlayState extends FlxState
	{
		public var gameState : GameStateHolder;
		
		public var currentScene : FlxSprite;
		public var sceneLayer : FlxGroup;
		public var aOptionBg : FlxExtendedSprite;
		public var aOptionIconLayer : FlxGroup;
		public var aOptionIcon : FlxSprite;
		public var bOptionBg : FlxExtendedSprite;
		public var bOptionIconLayer : FlxGroup;
		public var bOptionIcon : FlxSprite;
		
		public var guyLayer : FlxGroup;
		public var guySprite : FlxSprite;
		public var girlSprite : FlxSprite;
		
		//public var censoredSprite : FlxSprite;
		public var isFamilyGame : Boolean = true;
		//public var censorHeight : Array = [143, 132, 122, 111, 107, 107, 107, 105, 105, 105, 105, 106, 108, 117];
		
		public var awareZones : Boolean;
		
		public function PlayState()
		{
			super();
		}
		
		public override function create() : void {
			gameState = new GameStateHolder();
			gameState.stateChanged.add(stateChangedListener);
			
			sceneLayer = new FlxGroup();
			add(sceneLayer);
			
			aOptionBg = new FlxExtendedSprite(6, FlxG.width / 2 - 100, AssetRegistry.icono_bg_circulo);
			aOptionBg.mouseReleasedCallback = aOptionClicked;
			aOptionBg.enableMouseClicks(true);
			add(aOptionBg);
			
			bOptionBg = new FlxExtendedSprite(218, FlxG.width / 2 - 100, AssetRegistry.icono_bg_circulo);
			bOptionBg.mouseReleasedCallback = bOptionClicked;
			bOptionBg.enableMouseClicks(true);
			add(bOptionBg);
			
			aOptionIconLayer = new FlxGroup();
			add(aOptionIconLayer);
			
			bOptionIconLayer = new FlxGroup();
			add(bOptionIconLayer);
			
			guyLayer = new FlxGroup();
			add(guyLayer);
			
			//censoredSprite = new FlxSprite(23, 97).makeGraphic(19, 15, 0xff000000);
			
			awareZones = false;
			FlxG.watch(this, "awareZones");
			
			makeScene();
		}
		
		public override function update():void {
			super.update();
			
			if (FlxG.keys.LEFT) {
				FlxG.log("Chose A");
				if (awareZones) {
					if (gameState.state != GameStateHolder.SCENE_GAMEOVER) {
						FlxG.log("Pressed A option");
						gameState.choice = DecisionTree.A_OPTION;
						highlightOption(gameState.choice);
					} else {
						FlxG.switchState(new EndState());
					}
				}
			}
			
			if (FlxG.keys.RIGHT) {
				FlxG.log("Chose B");
				if (awareZones) {
					if (gameState.state != GameStateHolder.SCENE_GAMEOVER) {
						FlxG.log("Pressed B option");
						gameState.choice = DecisionTree.B_OPTION;
						highlightOption(gameState.choice);
					} else {
						FlxG.switchState(new PlayState());
					}
				}
			}
			
			gameState.update();
		}
		
		public function stateChangedListener(newState:String) : void {
			if (newState == GameStateHolder.SCENE_CHOICE) {
				//enable aware zones
				awareZones = true;
			} else if (newState == GameStateHolder.SCENE_TRANSITION_END) {
				//disable aware zones
				awareZones = false;
				//FlxG.flash(0, 2, gameState.finishTransition);
				TweenLite.to(currentScene, 1, {alpha:0, onComplete:gameState.finishTransition});
			} else if (newState == GameStateHolder.SCENE_TRANSITION_BEGIN) {
				makeScene();
			} else if (newState == GameStateHolder.SCENE_GAMEOVER) {
				/*
				bOptionBg.alpha = 1;
				aOptionBg.alpha = 1;
				
				if (Boolean(currentScene)) { sceneLayer.remove(currentScene); }
				if (Boolean(aOptionIcon)) { aOptionIconLayer.remove(aOptionIcon); }
				if (Boolean(bOptionIcon)) { bOptionIconLayer.remove(bOptionIcon); }
				if (Boolean(guySprite)) { guyLayer.remove(guySprite); }
				if (Boolean(girlSprite)) { guyLayer.remove(girlSprite); } 
				guyLayer.remove(censoredSprite);
				
				sceneLayer.add(new FlxSprite(0, 0, AssetRegistry.gameover));
				FlxG.flash(0, 1); */
				awareZones = true;
				makeDeathScene();
			}
		}
		
		private function makeDeathScene() : void {
			FlxG.log("Changing scene to death");
			bOptionBg.alpha = 1;
			aOptionBg.alpha = 1;
			
			if (Boolean(currentScene)) { sceneLayer.remove(currentScene); }
			if (Boolean(aOptionIcon)) { aOptionIconLayer.remove(aOptionIcon); }
			if (Boolean(bOptionIcon)) { bOptionIconLayer.remove(bOptionIcon); }
			if (Boolean(aOptionBg)) { aOptionBg.loadGraphic(AssetRegistry.icono_bg_circulo_blanco); }
			if (Boolean(bOptionBg)) { bOptionBg.loadGraphic(AssetRegistry.icono_bg_circulo_blanco); }
			if (Boolean(guySprite)) { guyLayer.remove(guySprite); /*guyLayer.remove(censoredSprite);*/ }
			if (Boolean(girlSprite)) { guyLayer.remove(girlSprite); } 
			
			aOptionIcon = new FlxSprite(0, 0, AssetRegistry.icono_creditos);
			aOptionIcon.x = aOptionBg.x+(aOptionBg.width - aOptionIcon.width)/2;
			aOptionIcon.y = aOptionBg.y+(aOptionBg.height - aOptionIcon.height)/2;
			aOptionIconLayer.add(aOptionIcon);
			
			bOptionIcon = new FlxSprite(0, 0, AssetRegistry.replay);
			bOptionIcon.x = bOptionBg.x+(bOptionBg.width - bOptionIcon.width)/2;
			bOptionIcon.y = bOptionBg.y+(bOptionBg.height - bOptionIcon.height)/2;
			bOptionIconLayer.add(bOptionIcon);
			
			var leftHand : FlxSprite = new FlxSprite(0, 0, AssetRegistry.mano_izq);
			leftHand.x = aOptionBg.x + bOptionBg.width - 15;
			leftHand.y = aOptionBg.y;
			add(leftHand);
			
			var rightHand : FlxSprite = new FlxSprite(0, 0, AssetRegistry.mano_der);
			rightHand.x = bOptionBg.x - rightHand.width + 15;
			rightHand.y = bOptionBg.y;
			add(rightHand);
			
			
			sceneLayer.add(new FlxSprite(0, 0, AssetRegistry.gameover));
			FlxG.flash(0, 1);
		}
		
		private function makeScene() : void {
			FlxG.log("Changing scene "+gameState.nameScene);
			if (Boolean(currentScene)) { sceneLayer.remove(currentScene); } 
			currentScene = new FlxSprite(0, 0, AssetRegistry[gameState.nameScene]);
			sceneLayer.add(currentScene);			
			
			bOptionBg.alpha = 1;
			aOptionBg.alpha = 1;
			
			if (Boolean(aOptionIcon)) { aOptionIconLayer.remove(aOptionIcon); } 
			if (gameState.aItemName != "") {
				aOptionIcon = new FlxSprite(0, 0, AssetRegistry["icono_" + gameState.lifeStage + "_" + gameState.aItemName]);
				aOptionIcon.x = aOptionBg.x+(aOptionBg.width - aOptionIcon.width)/2;
				aOptionIcon.y = aOptionBg.y+(aOptionBg.height - aOptionIcon.height)/2;
				aOptionIconLayer.add(aOptionIcon);
			}
			
			if (Boolean(bOptionIcon)) { bOptionIconLayer.remove(bOptionIcon); } 
			if (gameState.bItemName != "") {
				bOptionIcon = new FlxSprite(0, 0, AssetRegistry["icono_" + gameState.lifeStage + "_" + gameState.bItemName]);
				bOptionIcon.x = bOptionBg.x+(bOptionBg.width - bOptionIcon.width)/2;
				bOptionIcon.y = bOptionBg.y+(bOptionBg.height - bOptionIcon.height)/2;
				bOptionIconLayer.add(bOptionIcon);
			}
			
			if (Boolean(guySprite)) { guyLayer.remove(guySprite); } 
			if (Boolean(girlSprite)) { guyLayer.remove(girlSprite); FlxG.log("Deleting girl")} 
			
			FlxG.log("With girl " + gameState.withGirl.toString() );
			if (gameState.withGirl == 0) {
				if (Boolean(girlSprite)) { guyLayer.remove(girlSprite); FlxG.log("Deleting girl")} 

				guySprite = new FlxSprite(0, 0, AssetRegistry["guy"+gameState.numStage]);
				guySprite.x = (currentScene.width-guySprite.width)/2;
			} else if (gameState.withGirl == 1) {
				guySprite.x = (currentScene.width-guySprite.width)/2 + 30;
				girlSprite = new FlxSprite(0, 0, AssetRegistry["icono_adulto_jeva1"]);
				girlSprite.x = (currentScene.width-girlSprite.width)/2 - 30;
				girlSprite.y = (currentScene.height-girlSprite.height)/2 + 15;
				guyLayer.add(girlSprite);
			} else {
				guySprite.x = (currentScene.width-guySprite.width)/2 - 30;
				girlSprite = new FlxSprite(0, 0, AssetRegistry["icono_adulto_jeva2"]);
				girlSprite.x = (currentScene.width-girlSprite.width)/2 + 30;
				girlSprite.y = (currentScene.height-girlSprite.height)/2 + 15;
				guyLayer.add(girlSprite);
			}
			
			guySprite.y = (currentScene.height-guySprite.height)/2;
			guyLayer.add(guySprite);

			/*
			if (isFamilyGame) {
				guyLayer.add(censoredSprite);
				censoredSprite.x = guySprite.x + 23;
				censoredSprite.y = guySprite.y + 15+ censorHeight[gameState.numStage];
			} */
			
			FlxG.flash(0, 1, gameState.finishTransition);
		}
		
		private function aOptionClicked(s:FlxSprite, x:Number, y:Number) : void {
			FlxG.log("Clicked A");
			if (awareZones) {
				if (gameState.state != GameStateHolder.SCENE_GAMEOVER) {
					FlxG.log("Pressed A option");
					gameState.choice = DecisionTree.A_OPTION;
					highlightOption(gameState.choice);
				} else {
					FlxG.switchState(new EndState());
				}
			}
		}
		
		private function bOptionClicked(s:FlxSprite, x:Number, y:Number) : void {
			FlxG.log("Clicked B");
			if (awareZones) {
				if (gameState.state != GameStateHolder.SCENE_GAMEOVER) {
					FlxG.log("Pressed B option");
					gameState.choice = DecisionTree.B_OPTION;
					highlightOption(gameState.choice);
				} else {
					FlxG.switchState(new PlayState());
				}
			}
		}
		
		private function highlightOption(option : String) : void {
			if (option == DecisionTree.A_OPTION) {
				bOptionIcon.alpha = 0.5;
				bOptionBg.alpha = 0.5;
			}
			if (option == DecisionTree.B_OPTION) {
				aOptionIcon.alpha = 0.5;
				aOptionBg.alpha = 0.5;
			}
		}
	}
}