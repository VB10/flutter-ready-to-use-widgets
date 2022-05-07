/* Widget Description (for android) 
*With this widget, we perform page redirection with pleasant and colorful balls.
*[TR] Bu widget ile sayfa yönlendirme işlemlerini keyifli ve renkli toplarla gerçekleştiriyoruz.*/

/*Widget*/ circleNavigatorButton(
    {required String text,
    required IconData icon,
    required Color color,
    required Widget widget,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(
            icon,
            color: Colors.black,
            size: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(text)
      ],
    ),
  );
}
