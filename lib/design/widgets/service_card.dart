import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceCard extends StatefulWidget {
  final Map<String, dynamic> service;

  const ServiceCard({
    super.key,
    required this.service,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isExpanded = false;
  int currentImage = 0;

  Future<void> openUrl(String url) async {
    if (url.trim().isEmpty) return;

    Uri uri = Uri.parse(url);

    if (!url.startsWith('http') &&
        !url.startsWith('https') &&
        !url.startsWith('tel:')) {
      uri = Uri.parse("https://$url");
    }

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> openPhone(String phone) async {
    await launchUrl(Uri.parse("tel:$phone"));
  }

  Future<void> openWhatsapp(String phone) async {
    final clean = phone.replaceAll("+", "");

    await launchUrl(
      Uri.parse("https://wa.me/$clean"),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> openMap(String location) async {
    await launchUrl(
      Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$location",
      ),
      mode: LaunchMode.externalApplication,
    );
  }

  void openImage(String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                top: 50,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoBox({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    if (value.trim().isEmpty) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: .04,
              ),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1B4332),
                    Color(0xFF52B788),
                  ],
                ),
              ),

              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      value,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF1B4332),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.service;

    final images = [
      s['image1'],
      s['image2'],
      s['image3'],
    ]
        .where(
          (e) =>
              e != null &&
              e.toString().trim().isNotEmpty,
        )
        .map((e) => e.toString())
        .toList();

    final name = s['name'] ?? '';
    final desc = s['description'] ?? '';
    final rating = "${s['rating'] ?? 0}";
    final phone = s['phone'] ?? '';
    final whatsapp = s['whatsapp'] ?? '';
    final location = s['location_text'] ?? '';
    final website = s['website'] ?? '';
    final open = s['open_time'] ?? '';
    final close = s['close_time'] ?? '';

    return Container(
      height: 430,
      margin: const EdgeInsets.only(bottom: 28),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: .16,
            ),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(42),

        child: Stack(
          children: [
            // ================= IMAGES =================
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  if (images.isNotEmpty) {
                    openImage(images[currentImage]);
                  }
                },

                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx < -8 &&
                      currentImage <
                          images.length - 1) {
                    setState(() {
                      currentImage++;
                    });
                  }

                  if (details.delta.dx > 8 &&
                      currentImage > 0) {
                    setState(() {
                      currentImage--;
                    });
                  }
                },

                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedSwitcher(
                      duration:
                          const Duration(
                        milliseconds: 300,
                      ),

                      child: images.isNotEmpty
                          ? Image.network(
                              images[currentImage],
                              key: ValueKey(
                                images[currentImage],
                              ),
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color:
                                  Colors.grey.shade300,
                            ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin:
                              Alignment.topCenter,
                          end:
                              Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(
                              alpha: .15,
                            ),
                            Colors.black.withValues(
                              alpha: .75,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // dots
                    if (images.length > 1)
                      Positioned(
                        bottom: 135,
                        left: 0,
                        right: 0,

                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: List.generate(
                            images.length,
                            (i) => AnimatedContainer(
                              duration:
                                  const Duration(
                                milliseconds: 250,
                              ),

                              width:
                                  currentImage == i
                                      ? 22
                                      : 8,

                              height: 8,

                              margin:
                                  const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    currentImage == i
                                        ? Colors.white
                                        : Colors.white38,

                                borderRadius:
                                    BorderRadius.circular(
                                  20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // ================= NAME IN WHITE AREA =================
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,

              child: AnimatedOpacity(
                opacity: isExpanded ? 0 : 1,
                duration:
                    const Duration(milliseconds: 250),

                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    20,
                    24,
                    34,
                  ),

                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(
                          0,
                          255,
                          255,
                          255,
                        ),
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),

                  child: Directionality(
                    textDirection: TextDirection.rtl,

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        // الاسم
                        ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              colors: [
                                Color(0xFF0F172A),
                                Color(0xFF1B4332),
                                Color(0xFF52B788),
                              ],
                            ).createShader(bounds);
                          },

                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight:
                                  FontWeight.w900,
                              letterSpacing: .5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // الوصف
                        Text(
                          desc,
                          maxLines: 2,
                          overflow:
                              TextOverflow.ellipsis,

                          style: TextStyle(
                            color:
                                Colors.grey.shade700,
                            height: 1.6,
                            fontSize: 14,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // العنوان
                        if (location
                            .toString()
                            .isNotEmpty)
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(
                                  0xFF1B4332,
                                ),
                                size: 17,
                              ),

                              const SizedBox(width: 4),

                              Expanded(
                                child: Text(
                                  location,
                                  maxLines: 1,
                                  overflow:
                                      TextOverflow
                                          .ellipsis,

                                  style: TextStyle(
                                    color: Colors
                                        .grey
                                        .shade700,
                                    fontSize: 13,
                                    fontWeight:
                                        FontWeight
                                            .w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ================= CURTAIN =================
            AnimatedPositioned(
              duration:
                  const Duration(milliseconds: 500),

              curve: Curves.easeInOut,

              left: 0,
              right: 0,
              bottom: 0,
              top: isExpanded ? 0 : 350,

              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },

                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(
                      top: Radius.circular(
                        isExpanded ? 0 : 42,
                      ),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors: [
                        Colors.white,
                        Color(0xFFF8FAFC),
                        Color(0xFFF1F5F9),
                      ],
                    ),
                  ),

                  child: SingleChildScrollView(
                    child: Directionality(
                      textDirection:
                          TextDirection.rtl,

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width:
                                  isExpanded ? 72 : 58,
                              height: 8,

                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(
                                  30,
                                ),

                                gradient:
                                    const LinearGradient(
                                  colors: [
                                    Color(
                                      0xFF1B4332,
                                    ),
                                    Color(
                                      0xFF52B788,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          if (isExpanded) ...[
                            const SizedBox(
                              height: 28,
                            ),

                            // التفاصيل
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    desc,
                                    style:
                                        TextStyle(
                                      fontSize: 15,
                                      height: 1.8,
                                      color: Colors
                                          .grey
                                          .shade700,
                                    ),
                                  ),
                                ),

                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),

                                  decoration:
                                      BoxDecoration(
                                    color: const Color(
                                      0xFF1877F2,
                                    ),

                                    borderRadius:
                                        BorderRadius.circular(
                                      40,
                                    ),
                                  ),

                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.thumb_up,
                                        color: Colors
                                            .white,
                                        size: 18,
                                      ),

                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        rating,
                                        style:
                                            const TextStyle(
                                          color:
                                              Colors
                                                  .white,
                                          fontWeight:
                                              FontWeight
                                                  .bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            infoBox(
                              icon:
                                  Icons.location_on,
                              title: "الموقع",
                              value: location,
                              onTap: () =>
                                  openMap(location),
                            ),

                            infoBox(
                              icon: Icons.access_time,
                              title: "أوقات العمل",
                              value:
                                  "$open - $close",
                            ),

                            infoBox(
                              icon: Icons.call,
                              title: "رقم الهاتف",
                              value: phone,
                              onTap: () =>
                                  openPhone(phone),
                            ),

                            infoBox(
                              icon: Icons.chat,
                              title: "واتساب",
                              value: whatsapp,
                              onTap: () =>
                                  openWhatsapp(
                                whatsapp,
                              ),
                            ),

                            infoBox(
                              icon: Icons.language,
                              title:
                                  "الموقع الإلكتروني",
                              value: website,
                              onTap: () =>
                                  openUrl(website),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}