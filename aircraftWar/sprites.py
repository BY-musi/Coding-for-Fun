import pygame
import random

# 屏幕大小的常量
SCREEN_RECT = pygame.Rect(0, 0, 480, 700)

# 创建敌机的定时器常量
CREATE_ENEMY_EVENT = pygame.USEREVENT

# 创建英雄飞机发射子弹的事件
HERO_FIRE_EVENT = pygame.USEREVENT + 1

class GameSprite(pygame.sprite.Sprite):
    def __init__(self, image_name, speed=1):
        """调用父类的初始化方法"""
        super().__init__()

        """定义属性"""
        self.image = pygame.image.load(image_name)
        self.rect = self.image.get_rect()
        self.speed = speed

    def update(self):
        """精灵在游戏主窗口垂直方向下移动"""
        self.rect.y += self.speed



