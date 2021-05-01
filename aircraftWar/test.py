import pygame

pygame.init()
clock = pygame.time.Clock()

#i = 0
#while True:
#    clock.tick(60)
#    """ 事件监听 """
#    for event in pygame.event.get():
#        if event.type == pygame.QUIT:
#            print("退出游戏")
#            pygame.quit()
#
#            """ 直接退出游戏 """
#            exit()
#    print(i)
#    i += 1

while True:
    event_list = pygame.event.get()
    if len(event_list) > 0:
        print(event_list)
pygame.quit()
