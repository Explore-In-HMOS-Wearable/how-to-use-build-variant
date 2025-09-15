import BuildProfile from 'BuildProfile';

@Entry
@Component
struct Index {
  @State steps: number = 3587;

  estimateCalories(steps: number): number {
    return Math.floor(steps * 0.04);
  }

  build() {
    Column({ space: 12 }) {
      Text(false ? '🏃‍♂️ StepCounter Pro' : '🏃 StepCounter Lite')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(BuildProfile.IS_PREMIUM ? '#FFD700' : '#00C3FF')
        .margin({ top: 10, bottom: 6 })

      Text(`${this.steps} steps`)
        .fontSize(22)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FFFFFF')

      if (BuildProfile.IS_PREMIUM) {
        Text(`🔥 ${this.estimateCalories(this.steps)} kcal burned`)
          .fontSize(14)
          .fontColor('#FFA500')

        Text(`🏅 Premium User`)
          .fontSize(10)
          .fontColor('#FFD700')
      }

      Divider().margin({ top: 12 })

      Text(BuildProfile.IS_PREMIUM ? 'Enjoy your premium benefits!' : 'Upgrade for more stats')
        .fontSize(10)
        .fontColor('#AAAAAA')
    }
    .backgroundColor(BuildProfile.IS_PREMIUM ? '#1C1C1C' : '#000000')
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}