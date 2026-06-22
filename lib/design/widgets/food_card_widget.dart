import 'package:flutter/material.dart';

class FoodCardWidget extends StatefulWidget {

  final String name;
  final String image;
  final String subtitle;

  final String details;
  final String calories;
  final String time;
  final String rating;

  final VoidCallback? onTap;

  const FoodCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.subtitle,
    required this.details,
    required this.calories,
    required this.time,
    required this.rating,
    this.onTap,
  });

  @override
  State<FoodCardWidget> createState() =>
      _FoodCardWidgetState();
}

class _FoodCardWidgetState extends State<FoodCardWidget> {

  bool isExpanded = false;

  Widget buildPlaceholder() {
    return Container(
      color: const Color(0xFFF1F3F2),
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 42,
          color: Color(0xFF9E9E9E),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,

      child: Material(
        color: Colors.transparent,

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: isExpanded ? 0.12 : 0.07,
                ),
                blurRadius: isExpanded ? 24 : 18,
                spreadRadius: 1,
                offset: Offset(0, isExpanded ? 12 : 8),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              // الصورة
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(26),
                  ),

                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Scaffold(
                            backgroundColor: Colors.black,

                            body: SafeArea(
                              child: Stack(
                                children: [

                                  Center(
                                    child: InteractiveViewer(
                                      child: Image.asset(
                                        widget.image,
                                        fit: BoxFit.contain,
                                        filterQuality: FilterQuality.medium,
                                        errorBuilder: (context, error, stackTrace) {
                                          return buildPlaceholder();
                                        },
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 12,
                                    right: 12,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      if (widget.onTap != null) {
                        widget.onTap!();
                      }
                    },

                    child: Stack(
                      fit: StackFit.expand,

                      children: [

                        Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.medium,
                          errorBuilder: (context, error, stackTrace) {
                            return buildPlaceholder();
                          },
                        ),

                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.22),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(
                              alpha: isExpanded ? 0.01 : 0.03,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // النصوص (لم نغيرها لأنها ليست سبب الخطأ)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),

                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1B5E20),
                              ),
                            ),
                          ),

                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF1B5E20),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      maxLines: isExpanded ? 5 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),

                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 350),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox(),
                      secondChild: Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          children: [
                            Text(
                              widget.details,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.5,
                                color: Colors.grey[700],
                                height: 1.7,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                buildInfoChip(Icons.local_fire_department, widget.calories),
                                buildInfoChip(Icons.access_time, widget.time),
                                buildInfoChip(Icons.star, widget.rating),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F8E9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF2E7D32)),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }
}