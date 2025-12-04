import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) imageUrlBuilder;
  final String Function(T) nameBuilder;

  const CardSwiper({
    required this.items,
    required this.imageUrlBuilder,
    required this.nameBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (items.isEmpty) {
      return SizedBox(
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30), // margen arriba
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.55,
        child: Swiper(
          itemCount: items.length,
          layout: SwiperLayout.DEFAULT,
          viewportFraction: 0.8,
          scale: 0.9,
          itemBuilder: (context, index) {
            final item = items[index];
            final imageUrl = imageUrlBuilder(item);
            final name = nameBuilder(item);

            return Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: imageUrl.isNotEmpty
                        ? FadeInImage(
                            placeholder: const AssetImage('assets/no-image.jpg'),
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/no-image.jpg',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
