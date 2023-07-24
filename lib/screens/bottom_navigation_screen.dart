/*


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<Widget> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<BottomNavigationViewModel>().setSelectedIndex(0);
      await PushNotificationHelper.instance.pushNotificationNavigation(
          type:PushNotificationHelper.instance.type
      );
    });
    pages = [
      MarketScreen(),
      WatchlistScreen(),
      PortfolioScreen(),
      DiscussionScreen(),
      AccountScreen(),
    ];
    initToasterWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SocketViewModel>(
        builder: (context, socketViewModel, child) {
      return Scaffold(
        floatingActionButton: DraggableFab(
          child: FloatingActionButton.extended(
            //icon: Icon(Icons.feedback_outlined),
            onPressed: () {
              openLink(Uri.parse("https://forms.gle/iuUqUHbBhonmsuzv9"));
              },
            backgroundColor: CustomColors.purpleColor, label: Column(
            children: [
              Icon(Icons.feedback_outlined,size: 20,),
              SizedBox(height: 2,),
              Text('Feedback', style:TextStyle(fontSize: 8, color: Colors.white))
            ],
          ),
            */
/*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),*//*

          ),
        ),
        body: IndexedStack(
          children: pages,
          index: context.watch<BottomNavigationViewModel>().getSelectedIndex,
        ),
        //getScreenToDisplay(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              context.watch<BottomNavigationViewModel>().getSelectedIndex,
          type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.white,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (index) {
            if (index == 0) {
              context.read<StockViewModel>().setScrollToZeroIndex();
            }
            if (index == 2) {
              if (context
                  .read<PortfolioViewModel>()
                  .getPortfolioScrollController
                  .positions
                  .isNotEmpty) {
                context.read<PortfolioViewModel>().setScrollToZeroIndex();
              }
            }
            if(index == 3){
              context.read<DiscoverViewModel>().setScrollToZeroIndex();
            }
            context.read<BottomNavigationViewModel>().setSelectedIndex(index);
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: badges.Badge(
                  showBadge: socketViewModel.getIsLiveFeeds,
                  shape: badges.BadgeShape.square,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                  position: badges.BadgePosition.topEnd(top: -4, end: -24),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  badgeContent: Text('LIVE',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColors.whiteColor,
                              fontSize: 10))),
                  badgeColor: context
                              .watch<BottomNavigationViewModel>()
                              .getSelectedIndex ==
                          0
                      ? CustomColors.purpleColor
                      : CustomColors.pinkColor,
                  child: SvgPicture.asset(
                    homeIcon,
                    height: 28,
                    width: 28,
                    color: context
                                .watch<BottomNavigationViewModel>()
                                .getSelectedIndex ==
                            0
                        ? Theme.of(context).primaryColor
                        : CustomColors.greyColor,
                  ),
                ),
                label: "Markets"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  color: context
                              .watch<BottomNavigationViewModel>()
                              .getSelectedIndex ==
                          1
                      ? Theme.of(context).primaryColor
                      : CustomColors.greyColor,
                  watchlistIcon,
                  height: 28,
                  width: 28,
                ),
                label: "Watchlist"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  portfolioIcon,
                  height: 28,
                  width: 28,
                  color: context
                              .watch<BottomNavigationViewModel>()
                              .getSelectedIndex ==
                          2
                      ? Theme.of(context).primaryColor
                      : CustomColors.greyColor,
                ),
                label: "Portfolio"),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                discussionIcon,
                height: 28,
                width: 28,
                color: context
                            .watch<BottomNavigationViewModel>()
                            .getSelectedIndex ==
                        3
                    ? Theme.of(context).primaryColor
                    : CustomColors.greyColor,
              ),
              label: "News",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  profileIcon,
                  height: 28,
                  width: 28,
                  color: context
                              .watch<BottomNavigationViewModel>()
                              .getSelectedIndex ==
                          4
                      ? Theme.of(context).primaryColor
                      : CustomColors.greyColor,
                ),
                label: "Settings")
          ],
        ),
      );
    });
  }
}
*/
