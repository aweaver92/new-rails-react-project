import Player from "./Player.js";
import Resource from "./Resource.js";
import Enemy from "./Enemy.js";

export default class MainScene extends Phaser.Scene {
  constructor(){
    super("MainScene");
    this.enemies = [];
  }

  preload() {
    Player.preload(this);
    Enemy.preload(this);
    Resource.preload(this);
    this.load.image('tiles','assets/images/environment.png');
    this.load.tilemapTiledJSON('map1','assets/images/map1.json');
  }

  create(){
    const map = this.make.tilemap({key: 'map1'});
    this.map = map;
    const tileset = map.addTilesetImage('environment','tiles',32,32,0,0);
    const layer1 = map.createStaticLayer('Tile Layer 1',tileset,0,0);
    const layer2 = map.createStaticLayer('Tile Layer 2',tileset,0,0);
    const layer3 = map.createStaticLayer('Tile Layer 3',tileset,0,0);
    const layer4 = map.createStaticLayer('Tile Layer 4',tileset,0,0);
    const colliders = map.createStaticLayer('Colliders Layer',tileset,0,0);
    layer1.setCollisionByProperty({collides:true});
    // layer2.setCollisionByProperty({collides:false});
    // layer3.setCollisionByProperty({collides:false});
    // layer4.setCollisionByProperty({collides:false});
    // colliders.setCollisionByProperty({collides:true});
    this.matter.world.convertTilemapLayer(layer1);
    this.matter.world.convertTilemapLayer(colliders);
    this.map.getObjectLayer('Resources').objects.forEach(resource =>new Resource({scene:this,resource}));
    this.map.getObjectLayer('Enemies').objects.forEach(enemy => this.enemies.push(new Enemy({scene:this,enemy})));
    this.player = new Player({scene:this,x:200,y:220,texture:'female',frame:'townsfolk_f_idle_1'});
    this.player.inputKeys = this.input.keyboard.addKeys({
      up: Phaser.Input.Keyboard.KeyCodes.W,
      down: Phaser.Input.Keyboard.KeyCodes.S,
      left: Phaser.Input.Keyboard.KeyCodes.A,
      right: Phaser.Input.Keyboard.KeyCodes.D,
    })
  }

  update(){
    this.enemies.forEach(enemy => enemy.update());
    this.player.update();
  }
}
