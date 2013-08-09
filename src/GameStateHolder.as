package
{
	import flash.sampler.NewObjectSample;
	
	import org.flixel.FlxG;
	import org.osflash.signals.Signal;

	public class GameStateHolder
	{
		public static const SCENE_CHOICE : String = "SCENE_CHOICE";
		public static const SCENE_TRANSITION_BEGIN : String = "SCENE_TRANS_BEGIN";
		public static const SCENE_TRANSITION_END : String = "SCENE_TRANS_END";
		public static const SCENE_GAMEOVER : String = "SCENE_GAMEOVER";
		
		public var state : String = SCENE_TRANSITION_BEGIN;
		
		public var MAX_SCENE : Number = 180;
		public var timerScene : Number = 0;
		
		public var isGameOver : Boolean = false;
		
		public var numStage : Number = 1;
		public var lifeStage : String = 'ninio';
		public var nameScene : String = AssetRegistry.BG_PRIMAVERA;
		public var currentTreeIndex : Number;
		public var currentTreeNode : Object;
		public var aItemName : String;
		public var bItemName : String;
		
		public var choice : String = null;
		
		public var withGirl : int = 0;
		public var withKid : int = 0;
		public var dead : int = 0;
		
		public var stage1Objects : Object;
		public var stage1Tree : Array = [
			{pair: ["monopatin", "perro"], go_to: [1, 3, 2], // 0
				 aOptionCallback: function () : void { FlxG.log("Option A, go to 1"); stage1Tree.monopatin = true; },
				 bOptionCallback: function () : void { FlxG.log("Option B, go to 3"); stage1Tree.perro = true; },
				 noOptionCallback: function () : void { FlxG.log("Option NO, go to 2"); } },
			{pair: ["patin", "perro"], go_to: [4, 5, 6], // 1
				aOptionCallback: function () : void { FlxG.log("Option A, go to 4"); stage1Tree.patin = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 5"); stage1Tree.perro = true },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 6"); } }, 
			{pair: ["patin", "perro"], go_to: [4, 3, 6], // 2 
				aOptionCallback: function () : void { FlxG.log("Option A, go to 4"); stage1Tree.patin = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 3"); stage1Tree.perro = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 6"); } },
			{pair: ["tirachina", "comic"], go_to: [7, 8, 6], // 3 
				aOptionCallback: function () : void { FlxG.log("Option A, go to 7"); stage1Tree.tirachina = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 8"); stage1Tree.comic = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 6"); } },
			{pair: ["patineta", "bici"], go_to: [9, 10, 13], // 4
				aOptionCallback: function () : void { FlxG.log("Option A, go to 9"); stage1Tree.patineta = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 10"); stage1Tree.bici = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 13"); } },
			{pair: ["bici", "tirachina"], go_to: [11, 12, 13], // 5
				aOptionCallback: function () : void { FlxG.log("Option A, go to 11"); stage1Objects.bici = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 12"); stage1Objects.tirachina = true},
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 13"); } },
			{pair: ["patineta", "comic"], go_to: [9, 8, 13], // 6
				aOptionCallback: function () : void { FlxG.log("Option A, go to 9"); },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 8"); },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 13"); } },
			{pair: ["pistola", "comic"], go_to: [-1, 14, 13], // 7
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.pistola = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 15"); stage1Objects.comic = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 13"); } },
			{pair: ["tirachina", "libro"], go_to: [15, 16, 13], // 8
				aOptionCallback: function () : void { FlxG.log("Option A, go to 11"); stage1Objects.tirachina = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 12"); stage1Objects.libro = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 13"); } },
			{pair: ["pistola", "comic"], go_to: [-1, 17, 17], // 9
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.comic = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["comic", "tirachina"], go_to: [17, 17, 17], // 10
				aOptionCallback: function () : void { FlxG.log("Option A, go to 17"); stage1Objects.comic = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.tirachina = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["patineta", "comic"], go_to: [17, 17, 17], // 11
				aOptionCallback: function () : void { FlxG.log("Option A, go to 17"); stage1Objects.patineta = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.comic = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["pistola", "comic"], go_to: [-1, 17, 17], // 12
				aOptionCallback: function () : void {FlxG.log("Option A, go to die"); stage1Objects.pistola = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.comic = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["bici", "tirachina"], go_to: [17, 17, 17], // 13
				aOptionCallback: function () : void { FlxG.log("Option A, go to 17"); stage1Objects.bici = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.tirachina = true},
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["bici", "libro"], go_to: [17, 17, 17], // 14
				aOptionCallback: function () : void { FlxG.log("Option A, go to 17"); stage1Objects.bici = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.libro = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["pistola", "bici"], go_to: [-1, 17, 17], // 15
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.pistola = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.bici = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 17"); } },
			{pair: ["pistola", "bici"], go_to: [-1, 17, 17], // 16
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.pistola = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 17"); stage1Objects.bici = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["jeva1", "jeva2"], go_to: [18, 20, 19], // 17
				aOptionCallback: function () : void { FlxG.log("Option A, go to 18"); stage1Objects.jeva1 = true; withGirl = 1; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 20"); stage1Objects.jeva2 = true; withGirl = 2; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 19"); } },
			{pair: ["toronto", "jeva2"], go_to: [21, 22, 23], // 18
				aOptionCallback: function () : void { FlxG.log("Option A, go to 21"); stage1Objects.toronto = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 22"); stage1Objects.jeva2 = true; withGirl = 2; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 23"); } },
			{pair: ["jeva1", "jeva2"], go_to: [18, 20, 23], // 19
				aOptionCallback: function () : void { FlxG.log("Option A, go to 18"); stage1Objects.jeva1 = true; withGirl = 1; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 20"); stage1Objects.jeva2 = true; withGirl = 2; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 23"); } },
			{pair: ["jeva1", "condom"], go_to: [24, 25, 23], // 20
				aOptionCallback: function () : void { FlxG.log("Option A, go to 24"); stage1Objects.jeva1 = true; stage1Objects.jeva2 = true; withGirl = 3; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 25"); stage1Objects.condom = true; withGirl = 2; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 23"); } },
			{pair: ["refresco", "jeva2"], go_to: [26, 27, 27], // 21
				aOptionCallback: function () : void { FlxG.log("Option A, go to 26"); stage1Objects.refresco = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 27"); withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 27"); withGirl = 0; } },
			{pair: ["jeva1", "condom"], go_to: [28, 29, 27], // 22
				aOptionCallback: function () : void { FlxG.log("Option A, go to 28"); stage1Objects.jeva1 = true; withGirl = 1; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 29"); stage1Objects.condom = true; withGirl = 2 },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 27"); withGirl = 0; } },
			{pair: ["jeva1", ""], go_to: [18, 30, 30], // 23
				aOptionCallback: function () : void { FlxG.log("Option A, go to 18"); stage1Objects.jeva1 = true; withGirl = 1; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 30"); withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 30"); withGirl = 0; } },
			{pair: ["jeva1", ""], go_to: [31, 32, -1], // 24
				aOptionCallback: function () : void { FlxG.log("Option A, go to 31"); stage1Objects.jeva1 = true; withGirl = 1; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 32"); stage1Objects.jeva2 = true; withGirl = 2; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["maria", "helado"], go_to: [33, 34, 35], // 25
				aOptionCallback: function () : void { FlxG.log("Option A, go to 34"); stage1Objects.maria = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 35"); stage1Objects.helado = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); } },
			{pair: ["helado", "jeva3"], go_to: [39, 36, 39], // 26
				aOptionCallback: function () : void { FlxG.log("Option A, go to 39"); stage1Objects.helado = true; withGirl = 1; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); stage1Objects.jeva3 = true; withGirl = 3},
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 39"); withGirl = 1; } },
			{pair: ["jeva1", "jeva2"], go_to: [36, 36, 36], // 27
				aOptionCallback: function () : void { FlxG.log("Option A, go to 36"); withGirl = 0; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["helado", "jeva2"], go_to: [39, 36, 36], // 28
				aOptionCallback: function () : void { FlxG.log("Option A, go to 39"); },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["jeva4", "bebe"], go_to: [-1, 36, 36], // 29
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); withGirl = 0; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["", "jeva2"], go_to: [36, 32, 36], // 30
				aOptionCallback: function () : void { FlxG.log("Option A, go to 36"); withGirl = 0; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 32"); stage1Objects.jeva2 = true, withGirl = 2; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["helado", "condom"], go_to: [39, 36, 36], // 31
				aOptionCallback: function () : void { FlxG.log("Option A, go to 39"); stage1Objects.helado = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); stage1Objects.condom = true; withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["toronto", "condom"], go_to: [36, -1, 36], // 32
				aOptionCallback: function () : void { FlxG.log("Option A, go to 36"); stage1Objects.toronto = true; withGirl = 0; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to die"); stage1Objects.condom = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["inyectadora", "hongo"], go_to: [-1, 36, 36], // 33
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.inyectadoras = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); stage1Objects.hongo = true; withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["jeva4", "bebe"], go_to: [-1, 36, 36], // 34
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.jeva4 = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); stage1Objects.bebe = true; withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["condom", "bebe"], go_to: [-1, 36, 36], // 35
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.condom = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 36"); stage1Objects.bebe = true; withGirl = 0; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 36"); withGirl = 0; } },
			{pair: ["viagra", "cartas"], go_to: [-1, 38, 37], // 36
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.viagra = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 38"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 37"); } },
			{pair: ["pistola", "viagra"], go_to: [-1, -1, -1], // 37
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.pistola = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to die"); stage1Objects.viagra = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["cruz", "casino"], go_to: [-1, -1, -1], // 38
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.cruz = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to die"); stage1Objects.casino = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["carro", "anillo"], go_to: [40, 41, -1], // 39
				aOptionCallback: function () : void { FlxG.log("Option A, go to 40"); stage1Objects.carro = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 41"); stage1Objects.anillo = true; withKid = 1; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["viagra", "cartas"], go_to: [-1, -1, -1], // 40
				aOptionCallback: function () : void { FlxG.log("Option A, go to die"); stage1Objects.viagra = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to die"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["carro", "cartas"], go_to: [42, 43, -1], // 41
				aOptionCallback: function () : void { FlxG.log("Option A, go to 42"); stage1Objects.carro = true; withKid = 2; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 43"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["pelota", "cartas"], go_to: [44, -1, -1], // 42
				aOptionCallback: function () : void { FlxG.log("Option A, go to 44"); stage1Objects.pelota = true; withGirl = 0; withKid = 2; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to die"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["cruz", "casino"], go_to: [-1, -1, -1], // 43
				aOptionCallback: function () : void { FlxG.log("Option A, go to 42"); stage1Objects.carro = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 43"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to die"); } },
			{pair: ["", ""], go_to: [45, 45, 45], // 44
				aOptionCallback: function () : void { FlxG.log("Option A, go to 45"); stage1Objects.carro = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to 45"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to 45"); } },
			{pair: ["", ""], go_to: [0, 0, 0], // 45
				aOptionCallback: function () : void { FlxG.log("Option A, go to start"); stage1Objects.carro = true; },
				bOptionCallback: function () : void { FlxG.log("Option B, go to start"); stage1Objects.cartas = true; },
				noOptionCallback: function () : void { FlxG.log("Option NO, go to start"); } },
			
		];
		
		public var stateChanged : Signal;
		
		public function GameStateHolder()
		{
			stateChanged = new Signal(String /*newState*/);
			reset();
			
			FlxG.watch(this, "numStage");
			FlxG.watch(this, "nameScene");
			FlxG.watch(this, "timerScene");
			FlxG.watch(this, "state");
		}
		
		public function reset() : void {
			numStage = 1;
			//nameScene = getNextScene();
			nameScene = AssetRegistry.BG_PRIMAVERA;
			timerScene = 0;
			
			isGameOver = false;
			
			state = SCENE_TRANSITION_BEGIN;
			
			stage1Objects = {
				bici: false,
				comic: false,
				libro: false,
				monopatin: false,
				patin: false,
				patineta: false,
				perro: false,
				pistola: false,
				tirachina: false,
				lentes: false,
				jeva1: false,
				jeva2: false,
				jeva3: false,
				jeva4: false,
				bebe: false,
				hongo: false,
				toronto: false,
				condom: false,
				maria: false,
				refresco: false,
				helado: false
			};
			
			currentTreeIndex = 0;
			loadItems(stage1Tree);
		}
		
		public function startTransition() : void {
			if (state == SCENE_CHOICE) {
				state = SCENE_TRANSITION_END;
				stateChanged.dispatch(state);
			}
		}
		
		public function finishTransition() : void {
			if (state == SCENE_TRANSITION_END) {
				FlxG.play(AssetRegistry.heartbeat);
				
				timerScene = 0;
				numStage += 1;
				if (numStage >= 11) numStage = 11;
				
				if (numStage == 0) lifeStage = 'ninio';
				if (numStage == 5) lifeStage = 'adulto';
				
				if (isGameOver) {
					nameScene = "gameover";
					state = SCENE_GAMEOVER;
					stateChanged.dispatch(state);
				} else {
					nameScene = getNextScene();
					state = SCENE_TRANSITION_BEGIN;
					stateChanged.dispatch(state);
				}
			} else if (state == SCENE_TRANSITION_BEGIN) {
				state = SCENE_CHOICE;
				stateChanged.dispatch(state);
			}
		}
		
		public function update() : void {
			if (state == SCENE_CHOICE) {
				timerScene++;
				if (timerScene == MAX_SCENE) {
					if (choice == null) {
						choice = DecisionTree.NO_OPTION;
					}
					makeChoice(choice);
				}
			}
		}
		
		public function makeChoice(option:String) : void {
			//based in option and scene change stats
			if (option == DecisionTree.A_OPTION) {
				currentTreeIndex = currentTreeNode.go_to[0];
				if (currentTreeNode.aOptionCallback)
					currentTreeNode.aOptionCallback.apply(this);
			}
			
			if (option == DecisionTree.B_OPTION) {
				currentTreeIndex = currentTreeNode.go_to[1];
				if (currentTreeNode.bOptionCallback)
					currentTreeNode.bOptionCallback.apply(this);
			}
			
			if (option == DecisionTree.NO_OPTION) {
				currentTreeIndex = currentTreeNode.go_to[2];
				if (currentTreeNode.noOptionCallback)
					currentTreeNode.noOptionCallback.apply(this);
			}
			
			if (currentTreeIndex == -1) {
				isGameOver = true;
			} else {
				loadItems(stage1Tree);
			}
			
			choice = null;
			startTransition();
		}
		
		public function playChoiceSound(option : String) : void {
			if (option == DecisionTree.A_OPTION) {
				
			}
			
			if (option == DecisionTree.B_OPTION) {
				
			}
		}
		
		private function getNextScene() : String {
			var currentName : String = nameScene;
			var result : String;
			
			var scenes : Array = [AssetRegistry.BG_PRIMAVERA,  AssetRegistry.BG_VERANO, AssetRegistry.BG_OTONO, AssetRegistry.BG_INVIERNO];
			for  (var i : int = 0; i < scenes.length; i++) {
				if (scenes[i] == currentName) {
					if (i == scenes.length - 1) {
						result = scenes[0];
						break;
					} else {
						result = scenes[i+1];
						break;
					}
				}
			}
			
			return result;
		}
		
		private function loadItems(stageTree:Array) : void {
			currentTreeNode = stageTree[currentTreeIndex];
			
			aItemName = currentTreeNode.pair[0];
			bItemName = currentTreeNode.pair[1];
		}
	}
}